import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/element_entity.dart';

ElementEntity $ElementEntityFromJson(Map<String, dynamic> json) {
	final ElementEntity elementEntity = ElementEntity();
	final List<ElementCategoryEntity>? categoryList = jsonConvert.convertListNotNull<ElementCategoryEntity>(json['categoryList']);
	if (categoryList != null) {
		elementEntity.categoryList = categoryList;
	}
	final List<String>? cnameList = jsonConvert.convertListNotNull<String>(json['cnameList']);
	if (cnameList != null) {
		elementEntity.cnameList = cnameList;
	}
	final List<ElementContentEntity>? contentList = jsonConvert.convertListNotNull<ElementContentEntity>(json['contentList']);
	if (contentList != null) {
		elementEntity.contentList = contentList;
	}
	final int? countComment = jsonConvert.convert<int>(json['countComment']);
	if (countComment != null) {
		elementEntity.countComment = countComment;
	}
	final int? countEdit = jsonConvert.convert<int>(json['countEdit']);
	if (countEdit != null) {
		elementEntity.countEdit = countEdit;
	}
	final int? countSee = jsonConvert.convert<int>(json['countSee']);
	if (countSee != null) {
		elementEntity.countSee = countSee;
	}
	final int? createId = jsonConvert.convert<int>(json['createId']);
	if (createId != null) {
		elementEntity.createId = createId;
	}
	final String? createName = jsonConvert.convert<String>(json['createName']);
	if (createName != null) {
		elementEntity.createName = createName;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		elementEntity.createTime = createTime;
	}
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		elementEntity.ext = ext;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		elementEntity.id = id;
	}
	final String? idLabels = jsonConvert.convert<String>(json['idLabels']);
	if (idLabels != null) {
		elementEntity.idLabels = idLabels;
	}
	final String? imageUrls = jsonConvert.convert<String>(json['imageUrls']);
	if (imageUrls != null) {
		elementEntity.imageUrls = imageUrls;
	}
	final String? intro = jsonConvert.convert<String>(json['intro']);
	if (intro != null) {
		elementEntity.intro = intro;
	}
	final int? isDelete = jsonConvert.convert<int>(json['isDelete']);
	if (isDelete != null) {
		elementEntity.isDelete = isDelete;
	}
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		elementEntity.page = page;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		elementEntity.size = size;
	}
	final int? softtype = jsonConvert.convert<int>(json['softtype']);
	if (softtype != null) {
		elementEntity.softtype = softtype;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		elementEntity.status = status;
	}
	final String? tags = jsonConvert.convert<String>(json['tags']);
	if (tags != null) {
		elementEntity.tags = tags;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		elementEntity.title = title;
	}
	final int? updateId = jsonConvert.convert<int>(json['updateId']);
	if (updateId != null) {
		elementEntity.updateId = updateId;
	}
	final String? updateName = jsonConvert.convert<String>(json['updateName']);
	if (updateName != null) {
		elementEntity.updateName = updateName;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		elementEntity.updateTime = updateTime;
	}
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		elementEntity.version = version;
	}
	final int? wid = jsonConvert.convert<int>(json['wid']);
	if (wid != null) {
		elementEntity.wid = wid;
	}
	final String? wname = jsonConvert.convert<String>(json['wname']);
	if (wname != null) {
		elementEntity.wname = wname;
	}
	final String? pageHtml = jsonConvert.convert<String>(json['pageHtml']);
	if (pageHtml != null) {
		elementEntity.pageHtml = pageHtml;
	}
	return elementEntity;
}

Map<String, dynamic> $ElementEntityToJson(ElementEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['categoryList'] =  entity.categoryList?.map((v) => v.toJson()).toList();
	data['cnameList'] =  entity.cnameList;
	data['contentList'] =  entity.contentList?.map((v) => v.toJson()).toList();
	data['countComment'] = entity.countComment;
	data['countEdit'] = entity.countEdit;
	data['countSee'] = entity.countSee;
	data['createId'] = entity.createId;
	data['createName'] = entity.createName;
	data['createTime'] = entity.createTime;
	data['ext'] = entity.ext;
	data['id'] = entity.id;
	data['idLabels'] = entity.idLabels;
	data['imageUrls'] = entity.imageUrls;
	data['intro'] = entity.intro;
	data['isDelete'] = entity.isDelete;
	data['page'] = entity.page;
	data['size'] = entity.size;
	data['softtype'] = entity.softtype;
	data['status'] = entity.status;
	data['tags'] = entity.tags;
	data['title'] = entity.title;
	data['updateId'] = entity.updateId;
	data['updateName'] = entity.updateName;
	data['updateTime'] = entity.updateTime;
	data['version'] = entity.version;
	data['wid'] = entity.wid;
	data['wname'] = entity.wname;
	data['pageHtml'] = entity.pageHtml;
	return data;
}

ElementCategoryEntity $ElementCategoryEntityFromJson(Map<String, dynamic> json) {
	final ElementCategoryEntity elementCategoryEntity = ElementCategoryEntity();
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		elementCategoryEntity.code = code;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		elementCategoryEntity.id = id;
	}
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		elementCategoryEntity.label = label;
	}
	final String? pcode = jsonConvert.convert<String>(json['pcode']);
	if (pcode != null) {
		elementCategoryEntity.pcode = pcode;
	}
	final int? pid = jsonConvert.convert<int>(json['pid']);
	if (pid != null) {
		elementCategoryEntity.pid = pid;
	}
	final String? pidpath = jsonConvert.convert<String>(json['pidpath']);
	if (pidpath != null) {
		elementCategoryEntity.pidpath = pidpath;
	}
	final int? tier = jsonConvert.convert<int>(json['tier']);
	if (tier != null) {
		elementCategoryEntity.tier = tier;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		elementCategoryEntity.value = value;
	}
	final int? wid = jsonConvert.convert<int>(json['wid']);
	if (wid != null) {
		elementCategoryEntity.wid = wid;
	}
	return elementCategoryEntity;
}

Map<String, dynamic> $ElementCategoryEntityToJson(ElementCategoryEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['id'] = entity.id;
	data['label'] = entity.label;
	data['pcode'] = entity.pcode;
	data['pid'] = entity.pid;
	data['pidpath'] = entity.pidpath;
	data['tier'] = entity.tier;
	data['value'] = entity.value;
	data['wid'] = entity.wid;
	return data;
}

ElementContentEntity $ElementContentEntityFromJson(Map<String, dynamic> json) {
	final ElementContentEntity elementContentEntity = ElementContentEntity();
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		elementContentEntity.content = content;
	}
	final int? createId = jsonConvert.convert<int>(json['createId']);
	if (createId != null) {
		elementContentEntity.createId = createId;
	}
	final String? createName = jsonConvert.convert<String>(json['createName']);
	if (createName != null) {
		elementContentEntity.createName = createName;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		elementContentEntity.createTime = createTime;
	}
	final int? eid = jsonConvert.convert<int>(json['eid']);
	if (eid != null) {
		elementContentEntity.eid = eid;
	}
	final String? ext = jsonConvert.convert<String>(json['ext']);
	if (ext != null) {
		elementContentEntity.ext = ext;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		elementContentEntity.id = id;
	}
	final int? isNew = jsonConvert.convert<int>(json['isNew']);
	if (isNew != null) {
		elementContentEntity.isNew = isNew;
	}
	final int? isUpdate = jsonConvert.convert<int>(json['isUpdate']);
	if (isUpdate != null) {
		elementContentEntity.isUpdate = isUpdate;
	}
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		elementContentEntity.page = page;
	}
	final int? serial = jsonConvert.convert<int>(json['serial']);
	if (serial != null) {
		elementContentEntity.serial = serial;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		elementContentEntity.size = size;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		elementContentEntity.status = status;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		elementContentEntity.title = title;
	}
	final int? updateId = jsonConvert.convert<int>(json['updateId']);
	if (updateId != null) {
		elementContentEntity.updateId = updateId;
	}
	final String? updateName = jsonConvert.convert<String>(json['updateName']);
	if (updateName != null) {
		elementContentEntity.updateName = updateName;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		elementContentEntity.updateTime = updateTime;
	}
	final int? wid = jsonConvert.convert<int>(json['wid']);
	if (wid != null) {
		elementContentEntity.wid = wid;
	}
	return elementContentEntity;
}

Map<String, dynamic> $ElementContentEntityToJson(ElementContentEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['content'] = entity.content;
	data['createId'] = entity.createId;
	data['createName'] = entity.createName;
	data['createTime'] = entity.createTime;
	data['eid'] = entity.eid;
	data['ext'] = entity.ext;
	data['id'] = entity.id;
	data['isNew'] = entity.isNew;
	data['isUpdate'] = entity.isUpdate;
	data['page'] = entity.page;
	data['serial'] = entity.serial;
	data['size'] = entity.size;
	data['status'] = entity.status;
	data['title'] = entity.title;
	data['updateId'] = entity.updateId;
	data['updateName'] = entity.updateName;
	data['updateTime'] = entity.updateTime;
	data['wid'] = entity.wid;
	return data;
}