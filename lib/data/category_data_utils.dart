
import 'package:xinshijieapp/http/category_apis.dart';

import '/http/apis.dart';
import '/http/http_utils.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class CategoryDataUtils {

  /// 分页加载数据
  static void getTree<T>(
     int wid,
    {
    Success? success,
    Fail? fail,
  }) {
    HttpUtils.get(CategoryAPIs.getTree+"?wid=$wid", {},{}, success: success, fail: fail);
  }

}
