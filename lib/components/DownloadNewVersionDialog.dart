import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/main.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
// import 'package:xinshijieapp/utils/AppConstant.dart';
// import 'package:url_launcher/url_launcher.dart';

class DownloadNewVersionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(padding: EdgeInsets.only(top: 8, right: 16), child: Icon(Icons.close, color: appStore.iconColor)),
                ),
              ),
              Image.asset('images/log.png', height: 100),
              Text("当前不是最新版本,点击下载最新的版本", style: boldTextStyle(size: 20)).fit(),
              SizedBox(height: 6),
              Text("喜欢它?可以给它好评.", style: secondaryTextStyle(size: 16), textAlign: TextAlign.center),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: appColorPrimary,
                ),
                onPressed: () {
                  finish(context);
                  //加载网址
                  // launch(SourceCodeUrl);
                },
                child: Text('下载', style: primaryTextStyle(color: white)),
              ).paddingOnly(bottom: 24)
            ],
          ),
        ),
      ),
    );
  }
}
