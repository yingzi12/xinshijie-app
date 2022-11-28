import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/main.dart';
import 'package:xinshijieapp/models/AppModel.dart';
import 'package:xinshijieapp/screens/ProKitScreenListing.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/AppImages.dart';
import 'package:xinshijieapp/utils/AppStrings.dart';

List<Color> colors = [appCat1, appCat2, appCat3];

class ThemeItemWidget extends StatelessWidget {
  final int index;
  final ProTheme data;

  ThemeItemWidget(this.index, this.data);

  @override
  Widget build(BuildContext context) {
    //检测手势的小部件。 尝试识别与其非空回调相对应的手势。 如果这个小部件有一个孩子，它会遵从那个孩子的大小调整行为。如果它没有孩子，它会成长以适应父母
    return GestureDetector(
      onTap: () {
        if (appStore.isDarkModeOn) {
          appStore.toggleDarkMode(value: data.darkThemeSupported.validate());
        }

        if (data.sub_kits == null || data.sub_kits!.isEmpty) {
          if (data.widget != null) {
            log('Tag ${data.widget!.key}');

            data.widget.launch(context);
          } else {
            toasty(context, appComingSoon);
          }
        } else {
          ProKitScreenListing(data).launch(context);
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.all(16),
              child: Image.asset(icons[index % icons.length], color: Colors.white),
              decoration: boxDecorationDefault(color: colors[index % colors.length]),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Container(
                    width: context.width(),
                    height: 80,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    margin: EdgeInsets.only(right: context.width() / 28),
                    decoration: boxDecorationDefault(color: context.cardColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('${data.name.validate()}', style: boldTextStyle(), maxLines: 2),
                            Text(
                              data.title_name.validate(),
                              style: secondaryTextStyle(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ).visible(data.title_name.validate().isNotEmpty),
                          ],
                        ).expand(),
                        Container(
                          //height: 25,
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: data.tag.validate().isNotEmpty ? boxDecorationDefault(color: appDarkRed) : BoxDecoration(),
                          child: Text(data.tag.validate(), style: primaryTextStyle(color: white, size: 12)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                    decoration: boxDecorationDefault(color: colors[index % colors.length], shape: BoxShape.circle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
