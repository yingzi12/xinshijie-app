import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/element_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ElementEntity {

	String? audit;
	int? auditId;
	String? auditName;
	String? auditTime;
	int? countComment;
	int? countEdit;
	int? countSee;
	int? createId;
	String? createName;
	String? createTime;
	int? id;
	String? imageUrls;
	int? isDelete;
	int? isNew;
	int? page;
	int? size;
	int? softtype;
	int? sourceEid;
	int? status;
	String? tags;
	int? updateId;
	String? updateName;
	String? updateTime;
	int? version;
	int? wid;
	String? wname;
  
  ElementEntity();

  factory ElementEntity.fromJson(Map<String, dynamic> json) => $ElementEntityFromJson(json);

  Map<String, dynamic> toJson() => $ElementEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}