
import 'package:xinshijieapp/http/apis.dart';
import 'package:xinshijieapp/http/http_utils.dart';

class CaptchaDataUtils {
  /// 世界信息
  static void getCode<T>({
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.get(APIs.getCode,
        {},{}, success: success, fail: fail);
  }
}
