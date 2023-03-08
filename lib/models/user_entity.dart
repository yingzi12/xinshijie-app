import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {
	String? searchValue;
	String? createBy;
	String? createTime;
	int? createId;
	String? createName;
	String? updateBy;
	String? updateTime;
	String? updateName;
	int? updateId;
	String? remark;
	int? userId;
	int? deptId;
	String? userName;
	String? nickName;
	String? email;
	String? phonenumber;
	String? sex;
	String? avatar;
	String? password;
	String? status;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}