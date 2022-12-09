import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:xinshijieapp/generated/json/Result.g.dart';

@JsonSerializable()
class Result {
  //{"code": 0, "method": "GET", "requestPrams": "shenlong"}
  int? code;
  String? msg;
  int? total;

  Result({this.code, this.msg, this.total});

  // 固定格式，不同的类使用不同的mixin即可
  // 这里声明一个工厂构造方法
  factory Result.fromJson(Map<String, dynamic> json) => $ResultFromJson(json);

  Map<String, dynamic> toJson() => $ResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}