import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xinshijieapp/components/comment_component.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/screens/world/world_intro_screen.dart';
import 'package:xinshijieapp/utils/AppWidget.dart';

class HeadListCommentViewPage extends StatefulWidget {
  const HeadListCommentViewPage({Key? key}) : super(key: key);
  @override
  HeadListCommentViewPageState createState() {
    return HeadListCommentViewPageState();
  }
}

class HeadListCommentViewPageState extends State<HeadListCommentViewPage>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  int pageNum = 1;

  late EasyRefreshController _controller;

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
    CommentsDataUtils.getPageList({'pageNum':pageNum, 'pageSize': 6,'wid':32}, success: (res) {
      setState(() {
        List<CommentsEntity> commentsList2 = List<CommentsEntity>.from(
            res['rows'].map((x) => CommentsEntity.fromJson(x)));
        if(commentsList2 != null){
           commentsList.addAll(commentsList2);
        }
        _count=commentsList.length;
        print("-----------------_WorldCommnetScreen---- getCommentsList 获取数据完成 --------------------");
      });
    }, fail: (code, msg) {
      print("-----------------_WorldCommnetScreen---- getCommentsList fail --------------------");
    });
  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    CommentsEntity commentsEntity=new CommentsEntity();
    commentsEntity.comment="蠢蠢蠢蠢蠢";
    commentsEntity.nickname="test";
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
                title: Text('pull to refresh in header'),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.red,
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
                            _count = 10;
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
                            _count += 5;
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
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.insert_emoticon, color: Color(0xFF747474)),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(fontSize: 16.0, fontFamily: 'Regular'),
                            decoration: InputDecoration(hintText: "Type a message", border: InputBorder.none),
                          ),
                        ),
                        SizedBox(width: 8),
                        SvgPicture.asset("images/icons/social_send.svg"),
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
