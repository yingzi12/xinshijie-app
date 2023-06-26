import 'package:easy_refresh/easy_refresh.dart';
import 'package:xinshijieapp/components/discuss_component.dart';
import 'package:xinshijieapp/data/discuss_data_utils.dart';
import 'package:xinshijieapp/models/discuss_entity.dart';
import 'package:xinshijieapp/utils/bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:xinshijieapp/screens/CommentReplyComponent.dart';
import 'package:xinshijieapp/screens/keepalive.dart';
import 'package:xinshijieapp/utils/AppImages.dart';
import 'package:xinshijieapp/utils/space.dart';

class WorldDiscussScreen extends StatefulWidget {
  WorldDiscussScreen({Key? key, required this.wid}) : super(key: key);
  int wid;
  @override
  State<WorldDiscussScreen> createState() => _WorldDiscussScreenState();
}

class _WorldDiscussScreenState extends State<WorldDiscussScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("")),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        // children: [
                        Row(children: [
                          Container(
                            // 包裹设置头像大小
                            width: 20,
                            height: 20,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://www.sailmet.com/Content/Images/news/202204/3055a95d17ad4591a49451a426c889d3.jpg"),
                            ),
                          ),
                          Text("我是很长的用户名",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              )),
                          Icon(Icons.emoji_emotions, color: Colors.yellow),
                          Text("推荐",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 20.0,
                              )),
                        ]),
                        Text('冠寓是龙湖地产的第三大主航道业务，专注做中高端租赁市场，标语是我家我自在；门店位于昌平区390号，'
                            '距离昌平线生命科学冠寓是龙湖地产的第三大主航道业务，专注做中高端租赁市场，标语是我家我自在标语是我家我自在。'),
                        Divider(
                          height: 1,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Image.asset(
                                jitu,
                                height: 60,
                                width: 40,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text("这是一个标题"),
                              subtitle: Text("这是一个说明,这是一个说明"),
                            ),
                          ),
                        ]),
                        Divider(
                          height: 1,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "发布与 2/27 16:08",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabCommectDetailRou(wid: widget.wid),
          ),
          SVCommentReplyComponent(),
        ],
      ),
    );
  }
}



class TabCommectDetailRou extends StatefulWidget {
  TabCommectDetailRou({Key? key, required this.wid}) : super(key: key);
  int wid;
  @override
  _TabCommectDetailRouState createState() => _TabCommectDetailRouState();
}

class _TabCommectDetailRouState extends State<TabCommectDetailRou>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  int pageNum = 1;
  late TabController _tabController;
  late List<BadgeTab> tabs = <BadgeTab>[];
  List<DiscussEntity> discussList = [];
  late EasyRefreshController _controller;

  @override
  void initState() {
    init();
    // discussList = getDisscuss();
    tabs.add(BadgeTab(text: "讨论 10"));
    tabs.add(BadgeTab(text: "赞 100"));
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }

  Future<void> init() async {
    getDisscuss();
  }
  void getDisscuss()  {
    DiscussDataUtils.getPageList({'pageNum':pageNum, 'pageSize': 6,'wid':widget.wid}, success: (res) {
      setState(() {
        List<DiscussEntity> commentsList2 = List<DiscussEntity>.from(
            res['rows'].map((x) => DiscussEntity.fromJson(x)));
        if(commentsList2 != null){
          discussList.addAll(commentsList2);
        }
        _count=discussList.length;
      });
    }, fail: (code, msg) {
      print("-----------------_WorldCommnetScreen---- getCommentsList fail --------------------");
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Align(
        alignment: Alignment.topLeft,
        child: BrnTabBar(
          controller: _tabController,
          tabs: tabs,
          tabWidth: 80,
        ),
      ),
      Expanded(child:  TabBarView(
        //构建
        controller: _tabController,
        children: [
          KeepAliveWrapper(
            child: Container(
              alignment: Alignment.center,
              child:
              ListView(
                children: discussList.map((e) {
                  return DiscussComponet(discuss: e);
                }).toList(),
              ),
            ),
          ),
          KeepAliveWrapper(
            child: Container(
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: 100,
                  //列表项构造器
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: Container(
                          // 包裹设置头像大小
                          width: 30,
                          height: 30,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://www.sailmet.com/Content/Images/news/202204/3055a95d17ad4591a49451a426c889d3.jpg"),
                          ),
                        ),
                        title: Text('One-line ListTile'));
                  },
                )),
          ),
        ],
      ),),
      Space(66),

    ],);

  }


}

// const BaseUrl = 'https://assets.iqonic.design/old-themeforest-images/prokit';

// class SVDiscussModel {
//   String? name;
//   String? profileImage;
//   String? time;
//   String? comment;
//   int? likeCount;
//   bool? isCommentReply;
//   bool? like;
//   //未读的回复数,每次显示3条
//   int? unread;
//   SVDiscussModel({this.name, this.profileImage, this.time, this.comment, this.likeCount, this.isCommentReply, this.like,this.unread});
// }

// List<SVDiscussModel> getComments() {
//   List<DiscussEntity> list = [];
//
//
//   return list;
// }