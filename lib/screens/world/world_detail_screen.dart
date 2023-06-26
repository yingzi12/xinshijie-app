import 'dart:async';

import 'package:xinshijieapp/utils/bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/screens/world/world_intro_screen.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/AppWidget.dart';

import 'world_detail_comment_screen.dart';

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
  // List<CommentsEntity> commentsList=[];

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
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    UserModel userModel = Provider.of<UserModel>(context);
    // final themeData = Theme.of(context);
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
                  child:WorldIntroScreen(wid: widget.wid),
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
                        WorldDetailCommentScreen(wid:widget.wid)
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
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext dialogContext) {
                                    return BrnDialog(messageText: "请登录之后在评论");
                                  },
                                );
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
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext dialogContext) {
                                          return BrnDialog(
                                            messageText: "评论成功",
                                            actionsText: [],
                                          );
                                        },
                                      );
                                      //TODO 给出评论成功提示
                                    }, fail: (code, msg) {
                                      BrnDialogManager.showSingleButtonDialog(context,
                                        label: "确定",
                                        title: '错误',
                                        warning: msg,
                                      );
                                      //TODO 给出错误提示
                                    });
                                    _commentController.text = "";
                                  } else {
                                    //TODO 给出错误提示
                                    BrnDialogManager.showSingleButtonDialog(context,
                                      label: "确定",
                                      warning: '评论长度不能小于5',
                                    );
                                  }
                                } else {
                                  BrnDialogManager.showSingleButtonDialog(context,
                                      label: "确定",
                                      // title: '标题内容',
                                      warning: '请输入评论内容',
                                      // message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息。", onTap: () {
                                      //   BrnToast.show('知道了', context);
                                      // }
                                      );
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
