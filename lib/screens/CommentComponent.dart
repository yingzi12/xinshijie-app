import 'dart:ui';

import 'package:xinshijieapp/utils/bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/screens/CommentScreen.dart';
import 'package:xinshijieapp/screens/CommentReplyComponent.dart';
import 'package:xinshijieapp/screens/comment_dateil_screen.dart';

class CommentComponent extends StatefulWidget {
  final SVCommentModel comment;

  CommentComponent({required this.comment});

  @override
  State<CommentComponent> createState() => _CommentComponentState();
}

class _CommentComponentState extends State<CommentComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                svCommonCachedNetworkImage(
                        widget.comment.profileImage.validate(),
                        height: 48,
                        width: 48,
                        fit: BoxFit.cover)
                    .cornerRadiusWithClipRRect(8),
                16.width,
                Text(widget.comment.name.validate(),
                    style: boldTextStyle(size: 14)),
                4.width,
                Image.asset('images/icons/ic_TickSquare.png',
                    height: 14, width: 14, fit: BoxFit.cover),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'images/icons/ic_TimeSquare.png',
                  height: 14,
                  width: 14,
                  fit: BoxFit.cover,
                  color: context.iconColor,
                ),
                4.width,
                Text('${widget.comment.time.validate()} ago',
                    style:
                        secondaryTextStyle(color: svGetBodyColor(), size: 12)),
              ],
            )
          ],
        ),
        16.height,
        Text(widget.comment.comment.validate(),
            style: secondaryTextStyle(color: Colors.black)),
        16.height,
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: radius(4), color: svGetScaffoldColor()),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.comment.like.validate()
                      ? Image.asset('images/icons/ic_HeartFilled.png',
                          height: 14, width: 14, fit: BoxFit.fill)
                      : Image.asset(
                          'images/icons/ic_Heart.png',
                          height: 14,
                          width: 14,
                          fit: BoxFit.cover,
                          color: svGetBodyColor(),
                        ),
                  2.width,
                  Text(widget.comment.likeCount.toString(),
                      style: secondaryTextStyle(size: 12)),
                ],
              ),
            ).onTap(() {
              widget.comment.like = !widget.comment.like.validate();
              setState(() {});
            }, borderRadius: radius(4)),
            16.width,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: radius(4), color: svGetScaffoldColor()),
              child:
              BrnIconButton(
                  name: '11111',
                  direction: Direction.left,
                  padding: 4,
                  widgetWidth:80,
                  widgetHeight:20,
                  iconWidget: Icon(Icons.pending),
                  onTap: () {
                    //1.手机的物理分辨率
                    var physicalHeight = window.physicalSize.height;
                    //2.获取dpr
                    var dpr = window.devicePixelRatio;
                    //3.宽度和高度
                    var  screenHeight = physicalHeight /dpr;
                    print(screenHeight);
                    showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled:true,
                        builder: (BuildContext context) {
                          return Container(
                            height:  screenHeight*0.8,
                            color: Colors.amber,
                            child: CommentScreen(),
                          );
                        });
                  }),
            ),
          ],
        )
      ],
    ).paddingOnly(
        top: 16,
        left: widget.comment.isCommentReply.validate() ? 70 : 16,
        right: 16,
        bottom: 16);
  }
}
