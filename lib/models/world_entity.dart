import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/world_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class WorldEntity {

	int? countAddType;
	int? countAdmin;
	int? countComment;
	int? countDiscuss;
	int? countEdit;
	int? countElement;
	int? countFllow;
	int? countLike;
	int? countResident;
	int? countSee;
	int? countStory;
	int? createId;
	String? createName;
	String? createTime;
	String? description;
	int? id;
	String? imgUrl;
	String? intro;
	int? isPrive;
	String? name;
	int? ranks;
	int? scores;
	@JSONField(name: "source")
	String? xSource;
	int? status;
	String? typeName;
	int? types;
	int? updateId;
	String? updateName;
	String? updateNewElement;
	int? updateNewElementId;
	String? updateNewElementTime;
	String? updateTime;
	int? vitality;
  
  WorldEntity();

  factory WorldEntity.fromJson(Map<String, dynamic> json) => $WorldEntityFromJson(json);

  Map<String, dynamic> toJson() => $WorldEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}