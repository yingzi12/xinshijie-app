import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/element_entity.dart';

ElementEntity $ElementEntityFromJson(Map<String, dynamic> json) {
	final ElementEntity elementEntity = ElementEntity();
	final String? audit = jsonConvert.convert<String>(json['audit']);
	if (audit != null) {
		elementEntity.audit = audit;
	}
	final int? auditId = jsonConvert.convert<int>(json['auditId']);
	if (auditId != null) {
		elementEntity.auditId = auditId;
	}
	final String? auditName = jsonConvert.convert<String>(json['auditName']);
	if (auditName != null) {
		elementEntity.auditName = auditName;
	}
	final String? auditTime = jsonConvert.convert<String>(json['auditTime']);
	if (auditTime != null) {
		elementEntity.auditTime = auditTime;
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
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		elementEntity.id = id;
	}
	final String? imageUrls = jsonConvert.convert<String>(json['imageUrls']);
	if (imageUrls != null) {
		elementEntity.imageUrls = imageUrls;
	}
	final int? isDelete = jsonConvert.convert<int>(json['isDelete']);
	if (isDelete != null) {
		elementEntity.isDelete = isDelete;
	}
	final int? isNew = jsonConvert.convert<int>(json['isNew']);
	if (isNew != null) {
		elementEntity.isNew = isNew;
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
	final int? sourceEid = jsonConvert.convert<int>(json['sourceEid']);
	if (sourceEid != null) {
		elementEntity.sourceEid = sourceEid;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		elementEntity.status = status;
	}
	final String? tags = jsonConvert.convert<String>(json['tags']);
	if (tags != null) {
		elementEntity.tags = tags;
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
	return elementEntity;
}

Map<String, dynamic> $ElementEntityToJson(ElementEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['audit'] = entity.audit;
	data['auditId'] = entity.auditId;
	data['auditName'] = entity.auditName;
	data['auditTime'] = entity.auditTime;
	data['countComment'] = entity.countComment;
	data['countEdit'] = entity.countEdit;
	data['countSee'] = entity.countSee;
	data['createId'] = entity.createId;
	data['createName'] = entity.createName;
	data['createTime'] = entity.createTime;
	data['id'] = entity.id;
	data['imageUrls'] = entity.imageUrls;
	data['isDelete'] = entity.isDelete;
	data['isNew'] = entity.isNew;
	data['page'] = entity.page;
	data['size'] = entity.size;
	data['softtype'] = entity.softtype;
	data['sourceEid'] = entity.sourceEid;
	data['status'] = entity.status;
	data['tags'] = entity.tags;
	data['updateId'] = entity.updateId;
	data['updateName'] = entity.updateName;
	data['updateTime'] = entity.updateTime;
	data['version'] = entity.version;
	data['wid'] = entity.wid;
	data['wname'] = entity.wname;
	return data;
}