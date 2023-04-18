import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/element_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ElementEntity {

	List<ElementCategoryEntity>? categoryList;
	List<String>? cnameList;
	List<ElementContentEntity>? contentList;
	int? countComment;
	int? countEdit;
	int? countSee;
	int? createId;
	String? createName;
	String? createTime;
	String? ext;
	int? id;
	String? idLabels;
	String? imageUrls;
	String? intro;
	int? isDelete;
	int? page;
	int? size;
	int? softtype;
	int? status;
	String? tags;
	String? title;
	int? updateId;
	String? updateName;
	String? updateTime;
	int? version;
	int? wid;
	String? wname;
	String? pageHtml;
  
  ElementEntity();

  factory ElementEntity.fromJson(Map<String, dynamic> json) => $ElementEntityFromJson(json);

  Map<String, dynamic> toJson() => $ElementEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ElementCategoryEntity {

	String? code;
	int? id;
	String? label;
	String? pcode;
	int? pid;
	String? pidpath;
	int? tier;
	String? value;
	int? wid;
  
  ElementCategoryEntity();

  factory ElementCategoryEntity.fromJson(Map<String, dynamic> json) => $ElementCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => $ElementCategoryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ElementContentEntity {

	String? content;
	int? createId;
	String? createName;
	String? createTime;
	int? eid;
	String? ext;
	int? id;
	int? isNew;
	int? isUpdate;
	int? page;
	int? serial;
	int? size;
	int? status;
	String? title;
	int? updateId;
	String? updateName;
	String? updateTime;
	int? wid;
  
  ElementContentEntity();

  factory ElementContentEntity.fromJson(Map<String, dynamic> json) => $ElementContentEntityFromJson(json);

  Map<String, dynamic> toJson() => $ElementContentEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}