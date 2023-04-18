import 'package:bruno/bruno.dart';
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
import 'package:xinshijieapp/models/world_entity.dart';
import 'package:xinshijieapp/screens/story/chapter_list_screen.dart';
import 'package:xinshijieapp/screens/world/element_list_screen.dart';
import 'package:xinshijieapp/screens/world/world_intro_screen.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/AppConstant.dart';
import 'package:badges/badges.dart' as badges;
import 'package:xinshijieapp/utils/space.dart';
import '../../utils/AppWidget.dart';

class StoryDatailScreen extends StatefulWidget {
   StoryDatailScreen({Key? key,required this.wid,required this.sid}) : super(key: key);
  int wid;
  int sid;

  @override
  State<StoryDatailScreen> createState() => _StoryDatailScreenState();
}

class _StoryDatailScreenState extends State<StoryDatailScreen>  with SingleTickerProviderStateMixin {
  int _count = 0;
  int pageNum = 1;

  late EasyRefreshController _controller;
  TextEditingController _commentController = new TextEditingController();
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
    var width = MediaQuery.of(context).size.width;
    UserModel userModel = Provider.of<UserModel>(context);
    final themeData = Theme.of(context);
    return Scaffold(
      body: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          pinnedHeaderSliverHeightBuilder: () {
            return MediaQuery.of(context).padding.top + kToolbarHeight;
          },
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                pinned: true,
                title: Text('故事',style:TextStyle(color: appTextColorPrimary)),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  // height: 100,
                  child:getStoryIntro(),
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
                      ),
                      ),

                    ]),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width,
                    height: MediaQuery.of(context).size.width * 0.15,
                    color: Colors.green ,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.insert_emoticon, color: Color(0xFF747474)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _commentController,
                            style: TextStyle(fontSize: 16.0, fontFamily: 'Regular'),
                            decoration: InputDecoration(hintText: "Type a message", border: InputBorder.none),
                          ),
                        ),
                        SizedBox(width: 8),
                        //添加点击事件
                        InkWell(
                          child:  SvgPicture.asset("images/icons/social_send.svg"),
                          onTap: (){
                            if(userModel == null){
                              //TODO 给出错误提示
                              showDialog<void>(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext dialogContext) {
                                  return BrnDialog(messageText: "请登录之后在评论");
                                },
                              );
                            }else {
                              if (_commentController.text != null) {
                                CommentsEntity addEntity = new CommentsEntity();
                                addEntity.wid = widget.wid;
                                addEntity.source = 1;
                                addEntity.comment = _commentController.text;
                                addEntity.pid = 0;
                                if (_commentController.text.length > 5) {
                                  CommentsDataUtils.add(
                                      addEntity, success: (res) {
                                    // setState(() {
                                    //   commentsList = List<CommentsEntity>.from(
                                    //       res['rows'].map((x) => CommentsEntity.fromJson(x)));
                                    // });
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext dialogContext) {
                                        return BrnDialog(
                                          messageText: "评论成功",
                                          actionsText: [],
                                        );
                                      },
                                    );
                                    //TODO 给出评论成功提示
                                  }, fail: (code, msg) {
                                    BrnDialogManager.showSingleButtonDialog(context,
                                      label: "确定",
                                      title: '错误',
                                      warning: msg,
                                    );
                                    //TODO 给出错误提示
                                  });
                                  _commentController.text = "";
                                } else {
                                  //TODO 给出错误提示
                                  BrnDialogManager.showSingleButtonDialog(context,
                                    label: "确定",
                                    warning: '评论长度不能小于5',
                                  );
                                }
                              } else {
                                BrnDialogManager.showSingleButtonDialog(context,
                                  label: "确定",
                                  // title: '标题内容',
                                  warning: '请输入评论内容',
                                  // message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息。", onTap: () {
                                  //   BrnToast.show('知道了', context);
                                  // }
                                );
                                //TODO 给出错误提示
                              }
                            }
                          },
                        ),
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

  Widget getStoryIntro(){
    StoryEntity story=StoryEntity();
    story.wid=1;
    story.intro="这是一个说明.这是一个说明";
    story.name="伟大日记";
    story.wname="伟大的世界";
    story.id=1;
    story.typeName="科幻";
    story.createTime="2022-11-11 11:12:43";
    story.createName="admin";
    story.countAuthor=10;
    story.countChapter=110;
    story.countComment=11110;
    story.countDiscuss=0;
    story.countLike=11011;
    story.countSee=1123123;
    story.ranks=20;
    story.countHarding=2022;
    story.countWord=11111111;
    return Center(
      child: Column(
        children: <Widget>[
          //Flex的两个子widget按1：2来占据水平空间
          buildDatail(story),
          Space(8),
          //简介
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(story.intro ?? ""),
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
                             ChapterListScreen().launch(context);
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
                              children: <Widget>[Text("章节"), Text(story!.countChapter!.toString()?? "0")],
                            ))
                    )
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                      });
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[Text("评论"), Text(story!.countDiscuss!.toString()?? "0")],
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
                          children: <Widget>[Text("讨论"), Text(story.countComment!.toString()?? "0")],
                        ))),
              ],
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget buildDatail(StoryEntity story) {
    print("---------------_WorldDetailComponentState- build-----------------");
    var imageWidget;
    if(story.imgUrl == null){
      imageWidget = const AssetImage("images/empty.jpg");
    }else{
      imageWidget = NetworkImage(aliyunImgUrl+(story.imgUrl ?? ""));
    }
    return Card(
      child: Padding(
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
                image:  imageWidget,
              ),
            ),
            Expanded(
              flex: 4,
              child: buildDesc(story),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildDesc(StoryEntity story) {
    print("---------------_VideoDescription- build-----------------");
    // List<String> sourceList=story.xSource!.split(";");
    List<Widget> tagList=[];
    tagList.add(BrnStateTag(
      tagText: story.wname??"",
      tagState: TagState.waiting,
    ));
    tagList.add( BrnStateTag(
      tagText: story.typeName??"",
      tagState: TagState.succeed,
    ));
    int rank= story.ranks?? 0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          badges.Badge(
            badgeContent: Text(rank.toString()),
            child: Text(
              story.name ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            story.createName ?? "",
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            children: tagList,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: <Widget>[
              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                children: [Icon(Icons.apps,
                    color: Colors.green, size: 20),
                  Text(
                    "字数:"+story.countWord.toString(),
                    textScaleFactor: 0.8,
                  ),
                  Icon(Icons.apps,
                      color: Colors.green, size: 20),
                  Text(
                    "点赞:"+story.countLike.toString(),
                    textScaleFactor: 0.8,
                  ),
                  Icon(Icons.book,
                      color: Colors.green, size: 20),
                  Text(
                    "作者:"+story.countAuthor.toString(),
                    textScaleFactor: 0.8,
                  ),
                  Icon(Icons.comment,
                      color: Colors.green, size: 20),
                  Text(
                    "收藏:"+story.countHarding.toString(),
                    textScaleFactor: 0.8,
                  ),],
              ),
          //
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                child: Text("评论"),
                onPressed: () {
                  // ElementDetailComponent().launch(context);
                },
              ),
              SizedBox(width: 10),
              ElevatedButton(
                child: Text("收藏"),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }


  List<Widget> _listView(List<String> sourList){
    return sourList.map((f)=>
        BrnStateTag(
          tagText: f,
          tagState: TagState.succeed,
        )
    ).toList();
  }
}

