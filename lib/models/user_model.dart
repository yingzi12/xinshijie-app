import 'package:flutter/cupertino.dart';
import 'package:xinshijieapp/models/user_entity.dart';

class UserModel extends ChangeNotifier {
   UserEntity? userEntity;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin =>  userEntity != null ? true:false;

  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  void user(UserEntity user) {
    userEntity=user;
    notifyListeners();
  }
}
