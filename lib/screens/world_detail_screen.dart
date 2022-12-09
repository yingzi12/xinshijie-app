import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:xinshijieapp/components/comment_component.dart';

import 'package:xinshijieapp/utils/AppWidget.dart';
import 'package:xinshijieapp/utils/space.dart';

class WorldDetailScreen extends StatefulWidget {
  final int wid;
  const WorldDetailScreen({Key? key,required this.wid}) : super(key: key);

  @override
  State<WorldDetailScreen> createState() => _WorldDetailScreenState();
}

class _WorldDetailScreenState extends State<WorldDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("App Name"),
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
                const Card(
                  child: CustomWorldDetailItem(
                    user: 'Flutter',
                    viewCount: 999000,
                    imageUrl: "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                    title: 'The Flutter YouTube Channel',
                  ),

                ),
                Space(8),
                //标签
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("这一段很长的说明,这是一段很长的说明这一段很长的说明,这是一段很长的说明这一段很长的说明,这是一段很长的说明"),
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
                                children: <Widget>[Text("元素"), Text("2")],
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
                            children: <Widget>[Text("章节"), Text("30")],
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
                                children: <Widget>[Text("元素"), Text("2")],
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
                  children: [
                    CommentComponet(),
                    CommentComponet(),
                    CommentComponet(),
                    CommentComponet(),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Three-line ListTile'),
                        subtitle: Text(
                            'A sufficiently long subtitle warrants three lines.'),
                        trailing: Icon(Icons.more_vert),
                        isThreeLine: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomWorldDetailItem extends StatelessWidget {
  const CustomWorldDetailItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final String imageUrl;
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image(
                      width: 100.0,
                      height: 140.0,
                      fit:BoxFit.fill,
                      image: NetworkImage(imageUrl),
                    ),
          ),
          Expanded(
            flex: 4,
            child: _VideoDescription(
              title: title,
              user: user,
              viewCount: viewCount,
            ),
          ),
          // const Icon(
          //   Icons.more_vert,
          //   size: 16.0,
          // ),
        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                Wrap(
                  spacing: 8.0, // 主轴(水平)方向间距
                  runSpacing: 4.0, // 纵轴（垂直）方向间距
                  children: <Widget>[
                    BrnStateTag(
                      tagText: '这是一个长长的内容',
                      tagState: TagState.succeed,
                    ),
                    BrnStateTag(
                      tagText: '成功态',
                      tagState: TagState.succeed,
                    ),
                    BrnStateTag(
                      tagText: '成功态',
                      tagState: TagState.succeed,
                    ),
                    BrnStateTag(
                      tagText: '成功态',
                      tagState: TagState.succeed,
                    ),
                    BrnStateTag(
                      tagText: '成功态',
                      tagState: TagState.succeed,
                    ),
                    BrnStateTag(
                      tagText: '成功态',
                      tagState: TagState.succeed,
                    ),
                    BrnStateTag(
                      tagText: '成功态',
                      tagState: TagState.succeed,
                    ),
                    BrnStateTag(
                      tagText: '成功态',
                      tagState: TagState.succeed,
                    ),
                    BrnStateTag(
                      tagText: '成功态',
                      tagState: TagState.succeed,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.accessible,
                        color: Colors.green, size: 20),
                    Text(
                      "Hello",
                      textScaleFactor: 0.5,
                    ),
                    Icon(Icons.error,
                        color: Colors.green, size: 20),
                    Text(
                      "Hello",
                      textScaleFactor: 0.5,
                    ),
                    Icon(Icons.fingerprint,
                        color: Colors.green, size: 20),
                    Text(
                      "Hello",
                      textScaleFactor: 0.5,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("操作"),
                      onPressed: () {
                        // ElementDetailComponent().launch(context);
                      },
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      child: Text("操作"),
                      onPressed: () {},
                    ),
                  ],
                ),

        ],
      ),
    );
  }
}