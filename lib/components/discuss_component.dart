import 'package:xinshijieapp/models/discuss_entity.dart';
import 'package:xinshijieapp/utils/bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/utils/AppConstant.dart';

class DiscussComponet extends StatefulWidget {
  DiscussComponet({Key? key, required this.discuss}) : super(key: key);
  DiscussEntity discuss;

  @override
  State<DiscussComponet> createState() => _DiscussComponetState();
}

class _DiscussComponetState extends State<DiscussComponet> {

  @override
  void didUpdateWidget(covariant DiscussComponet oldWidget) {
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
                      aliyunImgUrl+widget.discuss.circleUrl.toString()),
                ),
              ),
              Text(widget.discuss.nickname ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  )),
              Offstage(
                offstage: widget.discuss.isRecommend == null ||
                        widget.discuss.isRecommend == 2
                    ? false
                    : true,
                child: Icon(Icons.emoji_emotions, color: Colors.yellow),
              ),
              Offstage(
                offstage: widget.discuss.isRecommend == null ||
                        widget.discuss.isRecommend == 2
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
                text: widget.discuss.comment ?? "",
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
                      // ReplyCommentScreen(comments:this.widget.discuss,).launch(context);
                    },
                    label: Text(widget.discuss.countLike.toString()),
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
                      // CommentDetailScreen(comments:this.widget.discuss).launch(context);
                    },
                    label: Text(widget.discuss.countReply.toString()),
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
