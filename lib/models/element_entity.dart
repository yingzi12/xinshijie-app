import 'package:xinshijieapp/generated/json/base/json_field.dart';
import 'package:xinshijieapp/generated/json/element_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ElementEntity {

	List<ElementCategoryList>? categoryList;
	List<dynamic>? cnameList;
	List<ElementContentList>? contentList;
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
  
  ElementEntity();

  factory ElementEntity.fromJson(Map<String, dynamic> json) => $ElementEntityFromJson(json);

  Map<String, dynamic> toJson() => $ElementEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ElementCategoryList {

	String? code;
	int? id;
	String? label;
	String? pcode;
	int? pid;
	String? pidpath;
	int? tier;
	String? value;
	int? wid;
  
  ElementCategoryList();

  factory ElementCategoryList.fromJson(Map<String, dynamic> json) => $ElementCategoryListFromJson(json);

  Map<String, dynamic> toJson() => $ElementCategoryListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ElementContentList {

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
  
  ElementContentList();

  factory ElementContentList.fromJson(Map<String, dynamic> json) => $ElementContentListFromJson(json);

  Map<String, dynamic> toJson() => $ElementContentListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}