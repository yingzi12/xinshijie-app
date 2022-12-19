///  data_utils.dart
///
///  Created by iotjin on 2021/04/01.
///  description:  项目数据请求 管理类

import 'package:xinshijieapp/http/category_apis.dart';
import 'package:xinshijieapp/http/element_apis.dart';

import '/http/apis.dart';
import '/http/http_utils.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class ElementDataUtils {

  /// 分页加载数据
  static void getTree<T>(
     int wid,
    {
    Success? success,
    Fail? fail,
  }) {
    HttpUtils.get(APIs.apiPrefix+ElementAPIs.getList+"?wid=$wid", {}, {},success: success, fail: fail);
  }

}
