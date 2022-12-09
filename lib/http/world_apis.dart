///  apis.dart
///
///  Created by iotjin on 2020/07/07.
///  description:  api 管理

class WorldAPIs {
  /// url 前缀
  static const String apiPrefix = 'http://192.168.16.139:8099';

  /// 获取世界列表
  static const String getWorldList = '/wiki/world/list';

  ///获取世界详细
  static const String getWorldInfo = '/wiki/world/getInfo';
}
