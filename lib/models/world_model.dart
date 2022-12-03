import 'package:xinshijieapp/common/ProfileChangeNotifier.dart';

class WorldModel extends ProfileChangeNotifier {
  // User get user => profile.user != null? profile.user:;



  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set world(World world) {
    // if (user?.login != profile.user?.login) {
    //   profile.lastLogin = profile.user?.login;
    //   profile.user = user;
      notifyListeners();
    // }
  }
}

class World {
  late String id;
  late String name;
  late String imgUrl;

}