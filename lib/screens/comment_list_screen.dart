import 'package:xinshijieapp/utils/bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:xinshijieapp/screens/keepalive.dart';
import 'package:xinshijieapp/screens/world/world_comment_screen.dart';
import 'package:xinshijieapp/utils/space.dart';

class CommentListScreen extends StatefulWidget {
  CommentListScreen({Key? key,required this.wid}) : super(key: key);
  int wid;
  @override
  State<CommentListScreen> createState() => _CommentListScreenState();
}

class _CommentListScreenState extends State<CommentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("2222")),
      body: Padding(padding:const EdgeInsets.all(8),child:  Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: BrnEnhanceNumberCard(
                  itemChildren: [
                    BrnNumberInfoItemModel(
                        title: '推荐比',
                        number: '3',
                        lastDesc: '%',
                        iconTapCallBack: (data) {}),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      //进度条显示50%
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        minHeight: 10,
                        value: .5,
                      ),
                    ),
                    Space(5),
                    //进度条显示50%
                    SizedBox(
                      width: 200,
                      //进度条显示50%
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        minHeight: 10,
                        value: .5,
                      ),
                    ),
                    Space(5),
                    //进度条显示50%
                    SizedBox(
                      width: 200,
                      //进度条显示50%
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        minHeight: 10,
                        value: .5,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Expanded(child:  TabViewRou(wid: widget.wid),),
        ],
      ),),
    );
  }
}

class TabViewRou extends StatefulWidget {
  TabViewRou({Key? key,required this.wid}) : super(key: key);
  int wid;
  @override
  _TabViewRouState createState() => _TabViewRouState();
}

class _TabViewRouState extends State<TabViewRou>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late  List<BadgeTab>   tabs = <BadgeTab>[];

  @override
  void initState() {
    tabs.add(BadgeTab(text: "业务一"));
    tabs.add(BadgeTab(text: "业务二"));
    tabs.add(BadgeTab(text: "业务三"));
    tabs.add(BadgeTab(text: "业务四"));
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          BrnTabBar(
            controller: _tabController,
            tabs: tabs,
          ),
          Expanded(child:
          TabBarView( //构建
            controller: _tabController,
            children: tabs.map((e) {
              return KeepAliveWrapper(
                child: Container(
                  alignment: Alignment.center,
                  child: WorldCommnetScreen(wid:widget.wid,pageNum: 1,),

                ),
              );
            }).toList(),
          ),
          ),
        ]
    );
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}
