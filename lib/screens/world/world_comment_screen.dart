import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/components/comment_component.dart';
import 'package:xinshijieapp/components/world_detail_component.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/data/world_data_utils.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/models/world_entity.dart';
import 'package:xinshijieapp/screens/element_list_screen.dart';

import 'package:xinshijieapp/utils/AppWidget.dart';
import 'package:xinshijieapp/utils/space.dart';

class WorldCommnetScreen extends StatefulWidget {
  WorldCommnetScreen({Key? key,required this.wid,required this.pageNum}) : super(key: key);
  int wid;
  int pageNum;
  @override
  State<WorldCommnetScreen> createState() => _WorldCommnetScreenState();
}

class _WorldCommnetScreenState extends State<WorldCommnetScreen> {

    List<CommentsEntity>? commentsList;

   @override
   void initState() {
     print("---------------_WorldCommnetScreen- initState-----------------");
    // TODO: implement initState
    super.initState();
     init();
  }


  Future<void> init() async {
    getCommentsList();
  }
  void getCommentsList()  {
    CommentsDataUtils.getPageList({'pageNum':widget.pageNum, 'pageSize': 10,'wid':widget.wid}, success: (res) {
      setState(() {
        commentsList = List<CommentsEntity>.from(
            res['rows'].map((x) => CommentsEntity.fromJson(x)));
        if(commentsList == null){
          commentsList= List.empty();
        }
        print("-----------------_WorldCommnetScreen---- getCommentsList 获取数据完成 --------------------");
        print(commentsList == null);
      });
    }, fail: (code, msg) {
      print("-----------------_WorldCommnetScreen---- getCommentsList fail --------------------");
    });
  }
  @override
  void didUpdateWidget(covariant WorldCommnetScreen oldWidget) {
    print("-----------------_WorldCommnetScreen---- didUpdateWidget 1 --------------------");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("-----------------_WorldCommnetScreen---- didUpdateWidget 2--------------------");
  }
  
  @override
  Widget build(BuildContext context) {
    print("---------------_WorldCommnetScreen- build-----------------");
    if( commentsList == null){
      print("---------------_WorldCommnetScreen- build or commentsList null -----------------");
      return Center(
        child: Text('加载中...'),
      );
    }else{
      print("---------------_WorldCommnetScreen- build and commentsList not -----------------");
    }
    return   ListView.builder(
      itemBuilder: (context, i) =>  CommentComponet(comments: commentsList![i]),
      itemCount: commentsList!.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}