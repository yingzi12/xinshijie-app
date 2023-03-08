import 'package:xinshijieapp/models/user_entity.dart';

import 'CacheConfig.dart';
import 'user_model.dart';

class Profile {
  Profile({
      this.user, 
      this.token, 
      required this.cache,
      this.lastLogin, 
      this.locale,});

  Profile.fromJson(dynamic json) {
    user = json['user?'];
    token = json['token?'];
    cache = json['cache'];
    lastLogin = json['lastLogin'];
    locale = json['locale?'];
  }
  UserEntity? user;
  String? token;
  CacheConfig? cache;
  String? lastLogin;
  String? locale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token?'] = token;
    map['lastLogin?'] = lastLogin;
    map['locale?'] = locale;
    return map;
  }

}