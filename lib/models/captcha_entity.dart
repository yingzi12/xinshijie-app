import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/captcha_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CaptchaEntity {

	String? uuid;
	String? img;
	bool? captchaEnabled;
	int? code;
  
  CaptchaEntity();

  factory CaptchaEntity.fromJson(Map<String, dynamic> json) => $CaptchaEntityFromJson(json);

  Map<String, dynamic> toJson() => $CaptchaEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}