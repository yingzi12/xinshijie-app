import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:xinshijieapp/components/comment_component.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/screens/world/world_intro_screen.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/AppWidget.dart';

class WorldDetailScreen extends StatefulWidget {
   WorldDetailScreen({Key? key,required this.wid}) : super(key: key);
  int wid;
  @override
  WorldDetailScreenState createState() {
    return WorldDetailScreenState();
  }
}

class WorldDetailScreenState extends State<WorldDetailScreen>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  int pageNum = 1;

  late EasyRefreshController _controller;
  TextEditingController _commentController = new TextEditingController();
  List<CommentsEntity> commentsList=[];

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> init() async {
    getCommentsList();
  }
  void getCommentsList()  {
    CommentsDataUtils.getPageList({'pageNum':pageNum, 'pageSize': 6,'wid':widget.wid}, success: (res) {
      setState(() {
        List<CommentsEntity> commentsList2 = List<CommentsEntity>.from(
            res['rows'].map((x) => CommentsEntity.fromJson(x)));
        if(commentsList2 != null){
           commentsList.addAll(commentsList2);
        }
        _count=commentsList.length;
      });
    }, fail: (code, msg) {
      print("-----------------_WorldCommnetScreen---- getCommentsList fail --------------------");
    });
  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    UserModel userModel = Provider.of<UserModel>(context);
    final themeData = Theme.of(context);
    return Scaffold(
      body: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          //pinnedHeaderSliverHeightBuilder: 在pinnedHeaderSliverHeightBuilder回调中设置全部pinned的header的高度， demo里面高度为 状态栏高度+SliverAppbar的高度
          pinnedHeaderSliverHeightBuilder: () {
            return MediaQuery.of(context).padding.top + kToolbarHeight;
          },
          ///headerSliverBuilder: 在内部滚动视图之前的任何小部件的构建器(由[body]给出)。
          ///通常这是用来创建[SliverAppBar]与[TabBar]。
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                pinned: true,
                title: Text('世界详细',style:TextStyle(color: appTextColorPrimary)),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  // height: 100,
                  child:WorldIntroScreen(wid: 32),
                ),
              ),
            ];
          },
          body: SafeArea(
            child:
            Stack(
              fit: StackFit.expand,
              children: [
                Column(
                    children: <Widget>[
                      homeTitleWidget(titleText: "评论", onAllTap: () {},),
                      Expanded(child:
                      EasyRefresh(
                        controller: _controller,
                        header: BezierCircleHeader(
                          foregroundColor: themeData.scaffoldBackgroundColor,
                          backgroundColor: themeData.colorScheme.primary,
                        ),
                        onRefresh: () async {
                          print("调用onRefresh");
                          await Future.delayed(const Duration(seconds: 2));
                          if (!mounted) {
                            return;
                          }
                          setState(() {
                            pageNum = 1;
                            _count=0;
                            commentsList.clear();
                            getCommentsList();
                            // _count = 10;
                          });
                          _controller.finishRefresh();
                          _controller.resetFooter();
                        },
                        onLoad: () async {
                          print("调用onLoad");
                          await Future.delayed(const Duration(seconds: 2));
                          if (!mounted) {
                            return;
                          }
                          setState(() {
                            pageNum +=1;
                            getCommentsList();
                          });
                          _controller.finishLoad(
                              _count >= 20 ? IndicatorResult.noMore : IndicatorResult.success);
                        },
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          padding: EdgeInsets.zero,
                          itemCount: _count,
                          itemBuilder: (ctx, index) {
                            print("调用ListView count:"+_count.toString()+" index:"+index.toString());
                            return   CommentComponet(comments:commentsList![index] );
                          },
                        ),
                      ),
                      ),

                    ]),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width,
                    height: MediaQuery.of(context).size.width * 0.15,
                    color: Colors.green ,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.insert_emoticon, color: Color(0xFF747474)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _commentController,
                            style: TextStyle(fontSize: 16.0, fontFamily: 'Regular'),
                            decoration: InputDecoration(hintText: "Type a message", border: InputBorder.none),
                          ),
                        ),
                        SizedBox(width: 8),
                        //添加点击事件
                        InkWell(
                          child:  SvgPicture.asset("images/icons/social_send.svg"),
                          onTap: (){
                              if(userModel == null){
                                //TODO 给出错误提示
                              }else {
                                if (_commentController.text != null) {
                                  CommentsEntity addEntity = new CommentsEntity();
                                  addEntity.wid = widget.wid;
                                  addEntity.source = 1;
                                  addEntity.comment = _commentController.text;
                                  addEntity.pid = 0;
                                  if (_commentController.text.length > 5) {
                                    CommentsDataUtils.add(
                                        addEntity, success: (res) {
                                      // setState(() {
                                      //   commentsList = List<CommentsEntity>.from(
                                      //       res['rows'].map((x) => CommentsEntity.fromJson(x)));
                                      // });
                                      //TODO 给出评论成功提示
                                    }, fail: (code, msg) {
                                      //TODO 给出错误提示
                                    });
                                    _commentController.text = "";
                                  } else {
                                    //TODO 给出错误提示
                                  }
                                } else {
                                  //TODO 给出错误提示
                                }
                              }
                          },
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset("images/icons/social_attachment.svg"),
                            SizedBox(width: 8),
                            SvgPicture.asset("images/icons/social_mic_line.svg"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),)
      ),
    );
  }
  // 构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }
}
