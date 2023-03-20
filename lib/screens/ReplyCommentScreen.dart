import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/main.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/screens/CommentReplyComponent.dart';
import 'package:xinshijieapp/utils/AppImages.dart';

class ReplyCommentScreen extends StatefulWidget {
  ReplyCommentScreen({Key? key, required this.comments}) : super(key: key);
  CommentsEntity comments;
  @override
  ReplyCommentScreenState createState() => ReplyCommentScreenState();
}

class ReplyCommentScreenState extends State<ReplyCommentScreen> {
  List<CommentsEntity> commentList =[];
  int _count = 0;
  int pageNum = 1;

  late EasyRefreshController _controller;
  TextEditingController _commentController = new TextEditingController();

  DateFormat timeFormat = DateFormat('hh:mm');
  DateFormat dateFormat = DateFormat('MMM dd,yyyy');
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
    CommentsDataUtils.getPageList({'pageNum':pageNum, 'pageSize': 6,'wid':widget.comments.wid,'pid':widget.comments.id}, success: (res) {
      setState(() {
        List<CommentsEntity> commentsList2 = List<CommentsEntity>.from(
            res['rows'].map((x) => CommentsEntity.fromJson(x)));
        if(commentsList2 != null){
          commentList.addAll(commentsList2);
        }
        _count=commentList.length;
      });
    }, fail: (code, msg) {
      print("-----------------_WorldCommnetScreen---- getCommentsList fail --------------------");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nbAppBarWidget(context, title: '回复'),
      body: Stack(
        children: [
          SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                16.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.comments.nickname!, style: boldTextStyle(color:  Color(0xFFFD5530))),
                        Text(widget.comments.comment!, style: boldTextStyle()),
                      ],
                    ).expand(flex: 2),
                  ],
                ),
                16.height,
                ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(commentList[index].circleUrl!),
                          radius: 30,
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${commentList[index].nickname}', style: boldTextStyle()),
                            4.height,
                            getReplay(commentList[index]),
                            // Text('${commentList[index].comment}', style: primaryTextStyle()),
                            8.height,
                            Row(
                              children: [
                                Text('${commentList[index].createTime}', style: secondaryTextStyle(color: grey.withOpacity(0.5))),
                              ],
                            ),
                          ],
                        ).expand(),
                      ],
                    ).paddingSymmetric(vertical: 8);
                  },
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                  itemCount: commentList.length,
                ),
              ],
            ).paddingOnly(left: 16, right: 16, bottom: 60),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                AppTextField(
                  controller: _commentController,
                  textFieldType: TextFieldType.OTHER,
                  textStyle: primaryTextStyle(),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                    filled: true,
                    hintText: 'Add Comment',
                    hintStyle: primaryTextStyle(),
                    fillColor: appStore.isDarkModeOn ? black : Colors.grey.shade200,
                  ),
                  cursorColor: Color(0xFFFD5530),
                ).expand(),
                Container(
                  height: 60,
                  width: 60,
                  child: Icon(Icons.send, color: white),
                  color: black,
                ).onTap(
                  () {
                    // setState(
                    //   () {
                        if (_commentController.text.isNotEmpty) {
                          if(_commentController.text.length>5) {
                            CommentsEntity addEntity=new CommentsEntity();
                            addEntity.wid=widget.comments.wid;
                            addEntity.source=1;
                            addEntity.comment = _commentController.text;
                            addEntity.upid=widget.comments.id;
                            CommentsDataUtils.reply(addEntity, success: (res) {
                              setState(() {
                                commentList.add(addEntity);
                                // commentsList = List<CommentsEntity>.from(
                                //     res['rows'].map((x) => CommentsEntity.fromJson(x)));
                              });
                              //TODO 给出评论成功提示
                            }, fail: (code, msg) {
                              //TODO 给出错误提示
                            });
                            // commentList.add(addEntity);
                            // commentList.add(
                              // NBCommentItemModel(
                              //   image: jitu,
                              //   name: 'XYZ',
                              //   message: commentController.text,
                              //   date: dateFormat.format(DateTime.now()),
                              //   time: timeFormat.format(DateTime.now()),
                              // ),
                            // );
                            _commentController.text="";
                          }else{
                            //TODO 给出错误提示
                          }
                        }
                      // },
                    // );
                    // _commentController.text = '';
                  },
                ),
              ],
            ),
          ),
        ],
      ).withHeight(context.height()),
    );
  }

  Widget getReplay(CommentsEntity entity){
    if(entity.ranks != 0 && entity.ranks != 1){
      return  Text('@${entity.replyNickname} :${entity.comment}', style: primaryTextStyle());
    }else{
      return  Text('${entity.comment}', style: primaryTextStyle());
  }
  }
}

AppBar nbAppBarWidget(BuildContext context, {String? title}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: appStore.isDarkModeOn ? white : black),
      onPressed: () {
        finish(context);
      },
    ),
    title: Text('$title', style: boldTextStyle(size: 20)),
    backgroundColor: context.cardColor,
    centerTitle: true,
  );
}