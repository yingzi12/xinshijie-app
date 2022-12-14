import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/discuss_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class DiscussEntity {

	String? circleUrl;
	String? comment;
	int? countDisagree;
	int? countLike;
	int? countReply;
	int? createId;
	String? createName;
	String? createTime;
	int? eid;
	int? id;
	String? nickname;
	int? page;
	String? reply;
	String? replyNickname;
	int? sid;
	int? size;
	String? sname;
	@JSONField(name: "source")
	int? xSource;
	int? status;
	String? title;
	int? types;
	int? updateId;
	String? updateName;
	String? updateTime;
	int? wid;
	String? wname;
  
  DiscussEntity();

  factory DiscussEntity.fromJson(Map<String, dynamic> json) => $DiscussEntityFromJson(json);

  Map<String, dynamic> toJson() => $DiscussEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}