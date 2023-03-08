import 'package:flutter/material.dart';
import 'package:xinshijieapp/components/comment_component.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/screens/world/world_comment_screen.dart';
import 'package:xinshijieapp/screens/world/world_intro_screen.dart';

import 'package:xinshijieapp/utils/AppWidget.dart';
import 'package:xinshijieapp/utils/space.dart';

class WorldDetailScreen extends StatefulWidget {
  WorldDetailScreen({Key? key,required this.wid}) : super(key: key);
  int wid;

  @override
  State<WorldDetailScreen> createState() => _WorldDetailScreenState();
}

class _WorldDetailScreenState extends State<WorldDetailScreen> {

   @override
   void initState() {
     print("---------------_WorldDetailScreenState- initState-----------------");
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WorldDetailScreen oldWidget) {
    print("-----------------_WorldDetailScreenState---- didUpdateWidget 1 --------------------");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("-----------------_WorldDetailScreenState---- didUpdateWidget 2--------------------");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("世界信息"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Scrollbar(
        // 显示进度条
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                WorldIntroScreen(wid: widget.wid),
                Space(8),
                homeTitleWidget(
                  titleText: "评论",
                  onAllTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CommentListScreen(),
                    //   ),
                    // );
                  },
                ),
                WorldCommnetScreen(wid:widget.wid)
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _listView(List<CommentsEntity> list){
    return list.map((f)=>
        CommentComponet(comments: f),
    ).toList();
  }
}