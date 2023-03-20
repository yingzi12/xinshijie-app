import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/screens/CommentComponent.dart';
import 'package:xinshijieapp/screens/CommentReplyComponent.dart';
import 'package:xinshijieapp/screens/keepalive.dart';
import 'package:xinshijieapp/utils/AppImages.dart';
import 'package:xinshijieapp/utils/space.dart';

class CommentDetailScreen extends StatefulWidget {
  CommentDetailScreen({Key? key, required this.comments}) : super(key: key);
  CommentsEntity comments;
  @override
  State<CommentDetailScreen> createState() => _CommentDetailScreenState();
}

class _CommentDetailScreenState extends State<CommentDetailScreen> {
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
            body: TabCommectDetailRou(),
          ),
          SVCommentReplyComponent(),
        ],
      ),
    );
  }
}



class TabCommectDetailRou extends StatefulWidget {
  @override
  _TabCommectDetailRouState createState() => _TabCommectDetailRouState();
}

class _TabCommectDetailRouState extends State<TabCommectDetailRou>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<BadgeTab> tabs = <BadgeTab>[];
  List<SVCommentModel> commentList = [];

  @override
  void initState() {
    commentList = getComments();
    tabs.add(BadgeTab(text: "讨论 10"));
    tabs.add(BadgeTab(text: "赞 100"));
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
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
                    children: commentList.map((e) {
                      return CommentComponent(comment: e);
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

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}

const BaseUrl = 'https://assets.iqonic.design/old-themeforest-images/prokit';

class SVCommentModel {
  String? name;
  String? profileImage;
  String? time;
  String? comment;
  int? likeCount;
  bool? isCommentReply;
  bool? like;
  //未读的回复数,每次显示3条
  int? unread;
  SVCommentModel({this.name, this.profileImage, this.time, this.comment, this.likeCount, this.isCommentReply, this.like,this.unread});
}

List<SVCommentModel> getComments() {
  List<SVCommentModel> list = [];

  list.add(SVCommentModel(
    name: 'Iana',
    profileImage: '$BaseUrl/images/socialv/faces/face_1.png',
    time: '4m',
    likeCount: 4,
    comment: 'Loving😍 your work and profile👨. Top Marks. Once you are confident enough to develop @ira_membrit',
    isCommentReply: false,
    like: false,
    unread:0,
  ));
  list.add(SVCommentModel(
    name: 'Allie',
    profileImage: '$BaseUrl/images/socialv/faces/face_2.png',
    time: '4m',
    likeCount: 4,
    comment: 'Nice 👌Work, love your content',
    isCommentReply: false,
    like: false,
    unread:0,
  ));
  list.add(SVCommentModel(
    name: 'Manny',
    profileImage: '$BaseUrl/images/socialv/faces/face_3.png',
    time: '4m',
    likeCount: 4,
    comment: 'Thanks 🤟@wad-warren. Follow us for more update',
    isCommentReply: true,
    like: false,
    unread:0,
  ));
  list.add(SVCommentModel(
    name: 'Isabelle',
    profileImage: '$BaseUrl/images/icons/faces/face_4.png',
    time: '4m',
    likeCount: 4,
    comment: 'Really Cool 👍 which filter are you using 🎞@con_trariweis',
    isCommentReply: true,
    like: false,
    unread:0,
  ));
  list.add(SVCommentModel(
    name: 'Jenny Wilson',
    profileImage: '$BaseUrl/images/icons/socialv/faces/face_5.png',
    time: '4m',
    likeCount: 4,
    comment: 'Hey Guys✋, I recommend you to try this smart pluginfor design System @Jane_Cooper',
    isCommentReply: false,
    like: false,
    unread:0,
  ));
  list.add(SVCommentModel(
    name: 'Iana',
    profileImage: '$BaseUrl/images/icons/socialv/faces/face_1.png',
    time: '4m',
    likeCount: 4,
    comment: 'Great,that awesome work @Jane_Cooper.',
    isCommentReply: false,
    like: false,
    unread:0,
  ));

  return list;
}