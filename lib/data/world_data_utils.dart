///  data_utils.dart
///
///  Created by iotjin on 2021/04/01.
///  description:  项目数据请求 管理类

import 'package:xinshijieapp/http/world_apis.dart';

import '/http/apis.dart';
import '/http/http_utils.dart';


class WorldDataUtils {

  /// 分页加载数据
  static void getPageList<T>(
    parameters, {
    Success? success,
    Fail? fail,
  }) {
    HttpUtils.get(WorldAPIs.getWorldList, {},parameters, success: success, fail: fail);
  }

  /// 世界信息
  static void getDatetail<T>(
      wid,
      {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.get("${WorldAPIs.getWorldInfo}/$wid",{},
        {}, success: success, fail: fail);
  }
}
