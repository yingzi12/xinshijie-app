

import 'package:xinshijieapp/http/comments_apis.dart';
import 'package:xinshijieapp/http/world_apis.dart';

import '/http/apis.dart';
import '/http/http_utils.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class CommentsDataUtils {

  /// 分页加载数据
  static void getPageList<T>(
    parameters, {
    Success? success,
    Fail? fail,
  }) {
    HttpUtils.get(APIs.apiPrefix+CommentsAPIs.getList, {},parameters, success: success, fail: fail);
  }

  /// 世界信息
  static void getDatetail<T>(
      wid,
      {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.get(APIs.apiPrefix+CommentsAPIs.getInfo+"/$wid",{},
        {}, success: success, fail: fail);
  }
}
