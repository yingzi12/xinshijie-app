// import 'package:xinshijieapp/common/ProfileChangeNotifier.dart';
//
// class LocaleModel extends ProfileChangeNotifier {
//   // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
//   Locale getLocale() {
//     if (_profile.locale == null) return null;
//     var t = _profile.locale.split("_");
//     return Locale(t[0], t[1]);
//   }
//
//   // 获取当前Locale的字符串表示
//   String get locale => _profile.locale;
//
//   // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
//   set locale(String locale) {
//     if (locale != _profile.locale) {
//       _profile.locale = locale;
//       notifyListeners();
//     }
//   }
// }