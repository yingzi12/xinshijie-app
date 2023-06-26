import 'package:xinshijieapp/utils/bruno/bruno.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:xinshijieapp/components/comment_component.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/models/story_entity.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/screens/story/chapter_list_screen.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/AppConstant.dart';
import 'package:badges/badges.dart' as badges;
import 'package:xinshijieapp/utils/space.dart';
import '../../utils/AppWidget.dart';

class StoryDatailCommitScreen extends StatefulWidget {
   StoryDatailCommitScreen({Key? key,required this.wid,required this.sid}) : super(key: key);
   int wid;
   int sid;

  @override
  State<StoryDatailCommitScreen> createState() => _StoryDatailCommitScreenState();
}

class _StoryDatailCommitScreenState extends State<StoryDatailCommitScreen>  with SingleTickerProviderStateMixin {
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
    return  EasyRefresh(
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

