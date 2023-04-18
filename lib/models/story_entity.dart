import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/story_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class StoryEntity {

	int? id;
	String? name;
	String? intro;
	String? description;
	int? permission;
	String? author;
	int? category;
	int? status;
	String? createTime;
	int? createId;
	String? createName;
	String? updateName;
	String? updateTime;
	int? updateId;
	String? tags;
	String? updateChapter;
	int? updateChapterId;
	String? updateChapterTime;
	int? exp;
	int? ranks;
	int? types;
	String? typeName;
	int? auditNumber;
	String? auditContent;
	int? countWord;
	String? imgUrl;
	int? isVip;
	int? wid;
	String? wname;
	int? auditId;
	String? auditName;
	String? auditTime;
	String? endTime;
	@JSONField(name: "source")
	String? xSource;
	int? countAuthor;
	int? countComment;
	int? countDiscuss;
	int? countChapter;
	int? countEdit;
	int? countHarding;
	int? countLike;
	int? countSee;
  
  StoryEntity();

  factory StoryEntity.fromJson(Map<String, dynamic> json) => $StoryEntityFromJson(json);

  Map<String, dynamic> toJson() => $StoryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}