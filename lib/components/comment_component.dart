import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CommentComponet extends StatefulWidget {
  const CommentComponet({Key? key}) : super(key: key);

  @override
  State<CommentComponet> createState() => _CommentComponetState();
}

class _CommentComponetState extends State<CommentComponet> {
  // late final NBNewsDetailsModel? newsDetails=new NBNewsDetailsModel(
  //   categoryName: 'Sports',
  //   title: 'NHL roundup: Mika Zibanejad\'s record night powers Rangers',
  //   date: '20 jan 2021',
  //   image: "jitu",
  //   details: details,
  //   time: '40:18',
  //   isBookmark: true,
  // );

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
            BrnExpandableText(
                text: '冠寓是龙湖地产的第三大主航道业务，专注做中高端租赁市场，标语是我家我自在；门店位于昌平区390号，'
                    '距离昌平线生命科学冠寓是龙湖地产的第三大主航道业务，专注做中高端租赁市场，标语是我家我自在标语是我家我自在。',
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
                    // finish(context);
                    // NBCommentScreen().launch(context);
                  },
                    label: Text("10"),
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
                      // CommentDetailScreen().launch(context);
                    },
                    label: Text("10"),
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
