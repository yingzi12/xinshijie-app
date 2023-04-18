import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppColors.dart';

class AppThemeData {
  //
  //
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: appColorPrimary,
    primaryColorDark: appColorPrimary,
    // errorColor: Colors.red,
    hoverColor: Colors.white54,
    dividerColor: viewLineColor,
    fontFamily: GoogleFonts.openSans().fontFamily,
    appBarTheme: AppBarTheme(
      color: whiteColor,
      iconTheme: IconThemeData(color: textPrimaryColor),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: ColorScheme.light(primary: appColorPrimary, primaryVariant: appColorPrimary),
    cardTheme: CardTheme(color: Colors.white),
    cardColor: cardLightColor,
    iconTheme: IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
    // textTheme: TextTheme(
    //   button: TextStyle(color: appColorPrimary),
    //   headline6: TextStyle(color: textPrimaryColor),
    //   subtitle2: TextStyle(color: textSecondaryColor),
    // ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
    }),
  );

  static final ThemeData darkTheme = ThemeData(
      //脚手架材料的默认颜色。 典型材质应用或应用内页面的背景色。
      // scaffoldBackgroundColor: appBackgroundColorDark,
      //选中墨水飞溅动画期间使用的高亮颜色或用于指示菜单中的项目。
      // highlightColor: appBackgroundColorDark,
      // appBarTheme: AppBarTheme(
      //   //用于应用程序栏材质的填充颜色
      //   backgroundColor: appBackgroundColorDark,
      //   //AppBar 的leading和 actions小部件的默认文本样式，但不是它的title。
      //   // toolbarTextStyle:TextStyle(color: Colors.black),
      //   //AppBar标题小部件的默认文本样式。
      //   titleTextStyle:TextStyle(color: Colors.black),
      //   iconTheme: IconThemeData(color: blackColor),
      //   systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      // ),
      //用于主题交互元素的颜色
     // 这种颜色通常用于按钮和可点击元素中的文本和图标。默认为CupertinoColors.activeBlue。
      primaryColor: color_primary_black,
      //primaryColor的深色版本。
      primaryColorDark: color_primary_black,
      //Divider和PopupMenuDivider的颜色，也用于ListTile之间、DataTable中的行之间，等等。
      dividerColor: Color(0xFFDADADA).withOpacity(0.3),
      //用于自定义TextField小部件的外观和布局的主题。
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
      hoverColor: Colors.black12,
      fontFamily: GoogleFonts.openSans().fontFamily,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
      primaryTextTheme: TextTheme(headline6: primaryTextStyle(color: Colors.white), overline: primaryTextStyle(color: Colors.white)),
      cardTheme: CardTheme(color: cardBackgroundBlackDark),
      cardColor: appSecondaryBackgroundColor,
      iconTheme: IconThemeData(color: whiteColor),
      textTheme: TextTheme(
        labelLarge: TextStyle(color: color_primary_black),
        titleLarge: TextStyle(color: whiteColor),
        titleSmall: TextStyle(color: Colors.white54),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme
          .dark(primary: appBackgroundColorDark,
          onPrimary: cardBackgroundBlackDark,
          error: Colors.red,
          primaryContainer: color_primary_black)
          .copyWith(secondary: whiteColor,error:Colors.red ),
  ).copyWith(
  pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
  TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
  }),
  );
}
