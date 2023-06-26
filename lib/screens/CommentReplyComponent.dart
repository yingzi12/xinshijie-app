import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/main.dart';
import 'package:xinshijieapp/screens/comment_dateil_screen.dart';
import 'package:xinshijieapp/utils/cached_network_image/cached_network_image.dart';

class SVCommentReplyComponent extends StatelessWidget {
  const SVCommentReplyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      color: svGetScaffoldColor(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Divider(indent: 16, endIndent: 16, height: 20),
          Row(
            children: [
              16.width,
              svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_5.png', height: 48, width: 48, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
              10.width,
              Container(
                width: context.width() * 0.5,
                child: AppTextField(
                  textFieldType: TextFieldType.OTHER,
                  decoration: InputDecoration(
                    hintText: 'Write A Comment',
                    hintStyle: secondaryTextStyle(color: svGetBodyColor()),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: Text('回复', style: secondaryTextStyle(color:  Color(0xFF1157FA)))),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            ],
          ),
        ],
      ),
    );
  }
}
Color svGetScaffoldColor() {
  if (appStore.isDarkModeOn)
    return  Colors.black38;
  else
    return  Color(0xFFF4F7F6);
}

Color svGetBodyColor() {
  if (appStore.isDarkModeOn)
    return Colors.black;
  else
    return Colors.white;
}
Widget svCommonCachedNetworkImage(
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
    return svCommonCachedNetworkImage(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}


Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/app/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
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