import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/screens/CommentScreen.dart';
import 'package:xinshijieapp/screens/ReplyCommentScreen.dart';
import 'package:xinshijieapp/screens/comment_dateil_screen.dart';
import 'package:xinshijieapp/utils/AppConstant.dart';

class CommentComponet extends StatefulWidget {
  CommentComponet({Key? key, required this.comments}) : super(key: key);
  CommentsEntity comments;

  @override
  State<CommentComponet> createState() => _CommentComponetState();
}

class _CommentComponetState extends State<CommentComponet> {

  @override
  void didUpdateWidget(covariant CommentComponet oldWidget) {
    print(
        "-----------------_CommentComponetState---- didUpdateWidget--------------------");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(children: [
              Container(
                // 包裹设置头像大小
                width: 20,
                height: 20,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      aliyunImgUrl+widget.comments.circleUrl.toString()),
                ),
              ),
              Text(widget.comments.nickname ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  )),
              Offstage(
                offstage: widget.comments.isRecommend == null ||
                        widget.comments.isRecommend == 2
                    ? false
                    : true,
                child: Icon(Icons.emoji_emotions, color: Colors.yellow),
              ),
              Offstage(
                offstage: widget.comments.isRecommend == null ||
                        widget.comments.isRecommend == 2
                    ? false
                    : true,
                child: Text("推荐",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20.0,
                    )),
              ),
            ]),
            BrnExpandableText(
                text: widget.comments.comment ?? "",
                maxLines: 3,
                onExpanded: (bool isExpanded) {
                  if (isExpanded) {
                    debugPrint('已经展开');
                  } else {
                    debugPrint('已经收起');
                  }
                }),
            Padding(
              padding: EdgeInsets.all(3.0),
              child: const Divider(
                height: 1,
                endIndent: 0,
                color: Colors.black,
              ),
            ),
            Row(children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: TextButton.icon(
                    //favorite
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      finish(context);
                      ReplyCommentScreen(comments:this.widget.comments,).launch(context);
                    },
                    label: Text(widget.comments.countLike.toString()),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: TextButton.icon(
                    icon: Icon(Icons.chat_bubble_outline),
                    onPressed: () {
                      finish(context);
                      CommentDetailScreen(comments:this.widget.comments).launch(context);
                    },
                    label: Text(widget.comments.countReply.toString()),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
