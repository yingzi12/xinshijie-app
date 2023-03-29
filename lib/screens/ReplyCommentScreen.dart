import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bruno/bruno.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/main.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/utils/AppColors.dart';

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

  // DateFormat timeFormat = DateFormat('hh:mm');
  // DateFormat dateFormat = DateFormat('MMM dd,yyyy');
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
    var width = MediaQuery.of(context).size.width;
    UserModel userModel = Provider.of<UserModel>(context);
    final themeData = Theme.of(context);
    return Scaffold(
      body: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          //pinnedHeaderSliverHeightBuilder: 在pinnedHeaderSliverHeightBuilder回调中设置全部pinned的header的高度， demo里面高度为 状态栏高度+SliverAppbar的高度
          pinnedHeaderSliverHeightBuilder: () {
            return MediaQuery.of(context).padding.top + kToolbarHeight;
          },
          ///headerSliverBuilder: 在内部滚动视图之前的任何小部件的构建器(由[body]给出)。
          ///通常这是用来创建[SliverAppBar]与[TabBar]。
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                pinned: true,
                title: Text('回复',style:TextStyle(color: appTextColorPrimary)),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  // height: 100,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(widget.comments.circleUrl!),
                              radius: 20,
                            ),
                            Text(widget.comments.nickname!, style: boldTextStyle(color:  Color(0xFFFD5530))),
                          ]),
                      Text(widget.comments.comment!, style: boldTextStyle()),
                    ],
                  ).expand(flex: 2).paddingLeft(16),
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
                      // homeTitleWidget(titleText: "评论", onAllTap: () {},),
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
                            commentList.clear();
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
                            return   getComment(commentList![index] ,userModel);
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
                                addEntity.wid = widget.comments.wid;
                                addEntity.source = 1;
                                addEntity.comment = _commentController.text;
                                addEntity.upid=widget.comments.id;
                                if (_commentController.text.length > 5) {
                                  CommentsDataUtils.reply(
                                      addEntity, success: (res) {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext dialogContext) {
                                        return BrnDialog(messageText: "评论成功");
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

  Widget getReplay(CommentsEntity entity){
    if(entity.ranks != 0 && entity.ranks != 1){
      return  Text('@${entity.replyNickname} :${entity.comment}', style: primaryTextStyle());
    }else{
      return  Text('${entity.comment}', style: primaryTextStyle());
    }
  }

  Widget getComment(CommentsEntity comment,UserModel userModel){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(comment.circleUrl!),
          radius: 30,
        ),
        16.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${comment.nickname}', style: boldTextStyle()),
            4.height,
            getReplay(comment),
            // Text('${commentList[index].comment}', style: primaryTextStyle()),
            4.height,
            Row(
              children: [
                Text('${comment.createTime}', style: secondaryTextStyle(color: grey.withOpacity(0.5))),
                IconButton(onPressed: (){
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
                    _showBottomWriteDialog(context, comment.nickname!,comment.id!);
                  }
                }, icon: Icon(Icons.pending,),)
              ],
            ).paddingAll(0),
          ],
        ).expand(),
      ],
    ).paddingSymmetric(vertical: 8).paddingLeft(16);
  }

  ///底部有输入框弹框
  void _showBottomWriteDialog(BuildContext context,String nickName,int id) {
    BrnBottomWritePicker.show(context,  title: '回复@$nickName',
      hintText: '请输入',
      confirmDismiss: true,
      onConfirm: (context, reply) {
        if (reply != null) {
          CommentsEntity addEntity = new CommentsEntity();
          addEntity.wid = widget.comments.wid;
          addEntity.source = 1;
          addEntity.comment = reply;
          addEntity.upid=id;
          if (reply.length > 5) {
            Navigator.of(context).pop(true);
            CommentsDataUtils.reply(addEntity, success: (res) {
              showOkAlertDialog(
                context: context,
                message: '回复成功.',
              );
            }, fail: (code, msg) {
              showOkAlertDialog(
                context: context,
                title: '异常',
                message: msg,
              );
            });
          } else {
            BrnToast.show("评论长度不能小于5", context,background:Colors.white,textStyle:TextStyle(fontSize: 16, color: Colors.red));
          }
        } else {
          BrnToast.show("请输入评论内容", context,background:Colors.white,textStyle:TextStyle(fontSize: 16, color: Colors.red));
        }
      },
      onCancel: (_){
        Navigator.of(context).pop(true);
        // BrnToast.show("说明", context);
      },
      defaultText: '',);
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