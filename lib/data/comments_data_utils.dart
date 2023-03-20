

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
    HttpUtils.get(CommentsAPIs.getList, {},parameters, success: success, fail: fail);
  }

  /// 火盆评论详细
  static void getDatetail<T>(
      wid,
      {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.get(CommentsAPIs.getInfo+"/$wid",{},
        {}, success: success, fail: fail);
  }
  ///添加评论
  static void add<T>(
      params,
      {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.post(CommentsAPIs.add,params,
         success: success, fail: fail);
  }

  ///添加评论
  static void reply<T>(
      params,
      {
        Success? success,
        Fail? fail,
      }) {
    HttpUtils.post(CommentsAPIs.reply,params,
        success: success, fail: fail);
  }
}
