import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/world_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class WorldEntity {

	int? id;
	String? name;
	String? description;
	int? types;
	dynamic typeName;
	String? intro;
	int? ranks;
	int? vitality;
	String? updateNewElement;
	int? updateNewElementId;
	int? scores;
	int? countElement;
	int? countResident;
	int? countAdmin;
	int? countComment;
	int? countLike;
	int? countSee;
	String? createTime;
	String? updateTime;
	String? createName;
	String? createId;
	String? updateName;
	int? updateId;
	int? status;
	String? imgUrl;
	String? updateNewElementTime;
	@JSONField(name: "source")
	String? xSource;
	int? isPrive;
	int? countFllow;
	int? countDiscuss;
	int? countAddType;
	int? countEdit;
	int? countStory;
  
  WorldEntity();

	// String get imgUrl => imgUrl ?? '';


	factory WorldEntity.fromJson(Map<String, dynamic> json) => $WorldEntityFromJson(json);

  Map<String, dynamic> toJson() => $WorldEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}