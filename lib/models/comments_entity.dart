import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/comments_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CommentsEntity {

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
	int? pid;
	int? ranks;
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
	int? upid;
	int? wid;
	String? wname;
	int? isRecommend;
	int? source;
  CommentsEntity();

  factory CommentsEntity.fromJson(Map<String, dynamic> json) => $CommentsEntityFromJson(json);

  Map<String, dynamic> toJson() => $CommentsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}