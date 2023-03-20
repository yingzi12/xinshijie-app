import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/main.dart';
import 'package:xinshijieapp/screens/CommentReplyComponent.dart';
import 'package:xinshijieapp/utils/AppImages.dart';

class CommentScreen extends StatefulWidget {
  static String tag = '/NBCommentScreen';

  late final NBNewsDetailsModel? newsDetails=new NBNewsDetailsModel(
    categoryName: 'Sports',
    title: 'NHL roundup: Mika Zibanejad\'s record night powers Rangers',
    date: '20 jan 2021',
    image: jitu,
    details: details,
    time: '40:18',
    isBookmark: true,
  );

  CommentScreen();

  @override
  CommentScreenState createState() => CommentScreenState();
}

class CommentScreenState extends State<CommentScreen> {
  List<NBCommentItemModel> commentList = nbGetCommentList();

  TextEditingController commentController = TextEditingController();

  DateFormat timeFormat = DateFormat('hh:mm');
  DateFormat dateFormat = DateFormat('MMM dd,yyyy');

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nbAppBarWidget(context, title: 'Comment'),
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
                        Text(widget.newsDetails!.categoryName!, style: boldTextStyle(color:  Color(0xFFFD5530))),
                        Text(widget.newsDetails!.title!, style: boldTextStyle()),
                      ],
                    ).expand(flex: 2),
                    4.width,
                    commonSHCachedNetworkImage(widget.newsDetails!.image!, height: 90, fit: BoxFit.fill).cornerRadiusWithClipRRect(16).expand(flex: 1),
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
                          backgroundImage: AssetImage(commentList[index].image!),
                          radius: 30,
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${commentList[index].name}', style: boldTextStyle()),
                            4.height,
                            Text('${commentList[index].message}', style: primaryTextStyle()),
                            8.height,
                            Row(
                              children: [
                                Text('${commentList[index].date}', style: secondaryTextStyle(color: grey.withOpacity(0.5))),
                                Text(' ${commentList[index].time}', style: secondaryTextStyle(color: grey.withOpacity(0.5))),
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
                  controller: commentController,
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
                    setState(
                      () {
                        if (commentController.text.isNotEmpty) {
                          commentList.add(
                            NBCommentItemModel(
                              image: jitu,
                              name: 'XYZ',
                              message: commentController.text,
                              date: dateFormat.format(DateTime.now()),
                              time: timeFormat.format(DateTime.now()),
                            ),
                          );
                        }
                      },
                    );
                    commentController.text = '';
                  },
                ),
              ],
            ),
          ),
        ],
      ).withHeight(context.height()),
    );
  }
}
class NBCommentItemModel {
  String? name;
  String? image;
  String? date;
  String? time;
  String? message;

  NBCommentItemModel({this.name, this.image, this.date, this.time, this.message});
}

class NBNewsDetailsModel {
  String? categoryName;
  String? title;
  String? date;
  String? image;
  String? details;
  bool isBookmark;
  String? time;

  NBNewsDetailsModel({this.categoryName, this.title, this.date, this.image, this.details, this.isBookmark = false, this.time});
}


List<NBCommentItemModel> nbGetCommentList() {
  List<NBCommentItemModel> commentList = [];
  commentList.add(NBCommentItemModel(
    image: jitu,
    name: 'Jones Hawkins',
    date: 'Jan 18,2021',
    time: '12:15',
    message: 'This is Very Helpful,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: jitu,
    name: 'Frederick Rodriquez',
    date: 'Jan 19,2021',
    time: '01:15',
    message: 'This is very Important for me,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: jitu,
    name: 'John Jordan',
    date: 'Feb 18,2021',
    time: '03:15',
    message: 'This is Very Helpful,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: jitu,
    name: 'Cameron Williamson',
    date: 'Jan 21,2021',
    time: '12:15',
    message: 'This is very Important for me,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: jitu,
    name: 'Cody Fisher',
    date: 'Jan 28,2021',
    time: '12:15',
    message: 'This is very helpful,thanks',
  ));
  return commentList;
}
String details = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.\n\n'
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.\n\n'
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.';


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
Widget commonSHCachedNetworkImage(
    String? url, {
      double? height,
      double? width,
      BoxFit? fit,
      AlignmentGeometry? alignment,
      bool usePlaceholderIfUrlEmpty = true,
      double? radius,
      Color? color,
    }) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return Image.asset(
      url,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
    ).cornerRadiusWithClipRRect(
      radius ?? defaultRadius,
    );
  }
}