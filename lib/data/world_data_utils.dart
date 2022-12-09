///  data_utils.dart
///
///  Created by iotjin on 2021/04/01.
///  description:  项目数据请求 管理类

import 'package:xinshijieapp/http/world_apis.dart';

import '/http/apis.dart';
import '/http/http_utils.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class WorldDataUtils {

  /// 分页加载数据
  static void getPageList<T>(
    parameters, {
    Success? success,
    Fail? fail,
  }) {
    HttpUtils.get(WorldAPIs.apiPrefix+WorldAPIs.getWorldList, parameters, success: success, fail: fail);
  }

  /// 分页加载数据
  static void getDatetail<T>(
      parameters, {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.get(WorldAPIs.apiPrefix+WorldAPIs.getWorldInfo, parameters, success: success, fail: fail);
  }
}
