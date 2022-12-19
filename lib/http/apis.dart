
class APIs {
  /// url 前缀
  // static const String apiPrefix = 'http://16.162.220.166:8099';
  static const String apiPrefix = 'http://10.0.2.2:8099';

  /// 登录接口
  static const String login = '/login';

  /// 刷新token
  static const String refreshToken = '/refreshToken';

  /// 获取分页数据
  static const String getPage = '/mock/pages';

  /// 获取分页分组数据
  static const String getGroupPage = '/mock/groupPages';

  /// 获取固定数据
  static const String getSimpleArrDic = '/getSimpleArrDic';
}
