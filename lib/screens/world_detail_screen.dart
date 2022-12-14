import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:xinshijieapp/components/comment_component.dart';
import 'package:xinshijieapp/components/world_detail_component.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/data/world_data_utils.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/models/world_entity.dart';
import 'package:xinshijieapp/models/world_model.dart';
import 'package:xinshijieapp/utils/AppConstant.dart';

import 'package:xinshijieapp/utils/AppWidget.dart';
import 'package:xinshijieapp/utils/space.dart';

class WorldDetailScreen extends StatefulWidget {
  WorldDetailScreen({Key? key,required this.wid}) : super(key: key);
  int wid;

  @override
  State<WorldDetailScreen> createState() => _WorldDetailScreenState();
}

class _WorldDetailScreenState extends State<WorldDetailScreen> {
    WorldEntity? world;

    List<CommentsEntity>? commentsList;

   @override
   void initState() {
     print("---------------_WorldDetailScreenState- initState-----------------");
    // TODO: implement initState
    super.initState();
     init();
  }


  Future<void> init() async {
    getWorldDatetail();
    getCommentsList();
  }
  void getWorldDatetail()  {
    WorldDataUtils.getDatetail(widget.wid, success: (res) {
      print("==============world mode ============getDtail========2========");
      setState(() {
        world = WorldEntity.fromJson(res["data"]);
        print("==============world mode ============getDtail========4========");
      });
      print("==============world mode ============getDtail========3========");
    }, fail: (code, msg) {}
    );
  }
  void getCommentsList()  {
    CommentsDataUtils.getPageList({'pageNum': 1, 'pageSize': 6,'wid':widget.wid}, success: (res) {
      setState(() {
        commentsList = List<CommentsEntity>.from(
            res['rows'].map((x) => CommentsEntity.fromJson(x)));
      });
    }, fail: (code, msg) {});
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
    print("---------------_WorldDetailScreenState- build-----------------");
    if(world == null ||commentsList == null){
      return Center(
        child: Text('加载中...'),
      );
    }
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
                //Flex的两个子widget按1：2来占据水平空间
                WorldDetailComponent(world: world!),
                Space(8),
                //简介
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(world?.intro ??""),
                ),
                Space(8),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child:  GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ElementListScreen(),
                                  //   ),
                                  // );
                                });
                              },
                              child:Container(
                              decoration: new BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.red, width: 1)), // 边色与边宽度
                                // borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
                              ),
                              child: Column(
                                children: <Widget>[Text("元素"), Text(world!.countElement!.toString()?? "0")],
                              ))
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => LargeDataScreen(),
                                  //   ),
                                  // );
                                });
                              },
                              child: Container(
                              child: Column(
                                children: <Widget>[Text("故事"), Text(world!.countStory!.toString()?? "0")],
                          )),
                          ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              decoration: new BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.red, width: 1)), // 边色与边宽度
                                // borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
                              ),
                              child: Column(
                                children: <Widget>[Text("讨论"), Text(world!.countComment!.toString()?? "0")],
                              ))),
                    ],
                  ),
                ),
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
                Column(
                  children: _listView(commentsList!),
                ),
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