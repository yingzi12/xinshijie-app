import 'dart:async';

import 'package:user_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';
//UserRepository公开了一个方法getUser来检索当前用户。我们正在存根，但实际上这是我们从后端查询当前用户的地方。
class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
          () => _user = User(const Uuid().v4()),
    );
  }
}