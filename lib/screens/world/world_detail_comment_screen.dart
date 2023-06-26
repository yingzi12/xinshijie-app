import 'dart:async';

import 'package:logger/logger.dart';
import 'package:xinshijieapp/utils/bruno/bruno.dart';
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

class WorldDetailCommentScreen extends StatefulWidget {
   WorldDetailCommentScreen({Key? key,required this.wid}) : super(key: key);
  int wid;
  @override
  WorldDetailCommentScreenState createState() {
    return WorldDetailCommentScreenState();
  }
}

class WorldDetailCommentScreenState extends State<WorldDetailCommentScreen>
    with SingleTickerProviderStateMixin {
  var logger = Logger();
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
    final themeData = Theme.of(context);
    return   EasyRefresh(
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
    );
  }
}
