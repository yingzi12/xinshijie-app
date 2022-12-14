import 'package:xinshijieapp/common/ProfileChangeNotifier.dart';
import 'package:xinshijieapp/data/world_data_utils.dart';
import 'package:xinshijieapp/models/world_entity.dart';

class WorldModel extends ProfileChangeNotifier {
  // User get user => profile.user != null? profile.user:;



  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set world(WorldEntity world) {
    // if (user?.login != profile.user?.login) {
    //   profile.lastLogin = profile.user?.login;
    //   profile.user = user;
      notifyListeners();
    // }
  }
}

List<WorldEntity> getList(){
  List<WorldEntity> worldRecommendedList= List.empty(growable: true);
  WorldDataUtils.getPageList({'pageNum': 1, 'pageSize': 6}, success: (res) {
      worldRecommendedList = List<WorldEntity>.from(res['rows'].map((x) => WorldEntity.fromJson(x)));
      }, fail: (code, msg) {}
  );
  return worldRecommendedList;
}

WorldEntity? getDtail(int wid){
  print("==============world mode ============getDtail========1========");
  WorldEntity? world=null;
  WorldDataUtils.getDatetail(wid, success: (res) {
    print("==============world mode ============getDtail========2========");
    world = WorldEntity.fromJson(res["data"]);
      }, fail: (code, msg) {}
  );
  print("==============world mode ============getDtail========3========");

  return world;
}