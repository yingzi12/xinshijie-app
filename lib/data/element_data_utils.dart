
import 'package:xinshijieapp/http/element_apis.dart';

import '/http/apis.dart';
import '/http/http_utils.dart';

class ElementDataUtils {

  /// 分页加载数据
  static void getPageList<T>(
      parameters, {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.get(ElementAPIs.getList, parameters,{}, success: success, fail: fail);
  }

  static void getInfo<T>(
      parameters, {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.get(ElementAPIs.getInfo, parameters,{}, success: success, fail: fail);
  }
}
