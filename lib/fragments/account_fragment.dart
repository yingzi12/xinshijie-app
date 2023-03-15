import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:xinshijieapp/http/apis.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/screens/sign_in_screen.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/AppConstant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/utils/AppImages.dart';
import 'package:xinshijieapp/main.dart';
import 'package:xinshijieapp/utils/AppWidget.dart';
import 'package:xinshijieapp/utils/space.dart';


class AccountFragment extends StatefulWidget {
  const AccountFragment({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AccountFragment());
  }
  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  var isSelected = 1;
  late var width;
  late var height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      //用户未登录，显示登录按钮
      return SignInScreen();
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          // backgroundColor: transparent,
          title: Text(
            userModel.userEntity?.userName?? "",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w900,
                fontSize: 20,
                color: appStore.isDarkModeOn ? white : black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 90,
                  width: 90,
                  child: CircleAvatar(
                      backgroundImage:AssetImage(jitu),//背景图，相当于加载中或加载失败的占位图
                      child: Image.network(APIs.imageUrlPrefix+(userModel.userEntity?.avatar??"")))
              ),
              Space(8),
              Text(userModel.userEntity?.nickName?? "", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
              Space(4),
              Text(userModel.userEntity?.email?? "无", textAlign: TextAlign.start,
                  style: TextStyle(color: appTextColorSecondary, fontSize: 12)),
              Space(16),

              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: mediaButton("世界", jitu),
                      onTap: () {
                        // MWWorldListScreen().launch(context);
                      },
                    ),
                    GestureDetector(
                      child: mediaButton("故事", jitu),
                      onTap: () {
                        print("tap");
                      },
                    ),
                    GestureDetector(
                      child: mediaButton("元素草稿", jitu),
                      onTap: () {
                        print("tap");
                      },
                    ),
                    GestureDetector(
                      child: mediaButton("章节草稿", jitu),
                      onTap: () {
                        print("tap");
                      },
                    ),
                  ],
                ),
              ),
              Space(16),
              ListTile(
                horizontalTitleGap: 4,
                leading: Icon(Icons.person, size: 20),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                title: Text("个人信息"),
                trailing: Icon(Icons.edit, size: 16),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
                },
              ),
              ListTile(
                horizontalTitleGap: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.notifications, size: 20),
                title: Text("我的关注"),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => BookingsFragment(fromProfile: true)));
                },
              ),
              ListTile(
                horizontalTitleGap: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.disc_full, size: 20),
                title: Text("我的评论", style: TextStyle()),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteProvidersScreen()));
                },
              ),
              ListTile(
                horizontalTitleGap: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.comment, size: 20),
                title: Text("我的讨论", style: TextStyle()),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteProvidersScreen()));
                },
              ),
              ListTile(
                horizontalTitleGap: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.notifications, size: 20),
                title: Text("信息通知"),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
              ),
              ListTile(
                horizontalTitleGap: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.paid_rounded, size: 20),
                title: Text("Refer and earn"),
                onTap: () {
                  //
                },
              ),
              ListTile(
                horizontalTitleGap: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.mail, size: 20),
                title: Text("Contact Us"),
                onTap: () {
                  //
                },
              ),
              ListTile(
                horizontalTitleGap: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.question_mark, size: 20),
                title: Text("Help Center"),
                onTap: () {
                  //
                },
              ),
              ListTile(
                horizontalTitleGap: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.local_offer, size: 20),
                title: Text("Offers And Coupons"),
                onTap: () {
                  //
                },
              ),
              Space(16),
            ],
          ),
        ),
      );
    }
  }
  Widget  mediaButton(String buttonText, String icon) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: appColorPrimaryLight),
          width: width / 5.5,
          height: width / 5.5,
          padding: EdgeInsets.all(width / 18),
          child: SvgPicture.asset(
            icon,
            color: appColorPrimary,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        text(buttonText, textColor: appStore.textPrimaryColor, fontSize: textSizeMedium, fontFamily: fontMedium)
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

}
