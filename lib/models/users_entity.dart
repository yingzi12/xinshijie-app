import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/users_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UsersEntity {
	late int userId;
	late String userName;
	late String nickName;
	late String email;
	late int isEmail;
	late String phonenumber;
	late String sex;
	late String avatar;
	late String status;
	late String delFlag;
	late String loginIp;
	late String loginDate;
	late int ranks;
	late int exp;
	late String tags;
	late int money;
	late String sign;
	late int countChapter;
	late int countComment;
	late int countDiscuss;
	late int countElement;
	late int countEdit;
	late int countFllow;
	late int countHarding;
	late int countLike;
	late int countWorld;
	late int countUpdate;
	late int countSee;
	late int countStory;
	late String remark;

	UsersEntity();

	factory UsersEntity.fromJson(Map<String, dynamic> json) => $UsersEntityFromJson(json);

	Map<String, dynamic> toJson() => $UsersEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}