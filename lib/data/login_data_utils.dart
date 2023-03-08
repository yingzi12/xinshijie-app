
import '/http/apis.dart';
import '/http/http_utils.dart';


class LoginDataUtils {
  /// 世界信息
  static void login<T>(
      params,
      {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.post(APIs.apiPrefix+APIs.login,
        params, success: success, fail: fail);
  }
}
