import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/world_entity.dart';

WorldEntity $WorldEntityFromJson(Map<String, dynamic> json) {
	final WorldEntity worldEntity = WorldEntity();
	final int? countAddType = jsonConvert.convert<int>(json['countAddType']);
	if (countAddType != null) {
		worldEntity.countAddType = countAddType;
	}
	final int? countAdmin = jsonConvert.convert<int>(json['countAdmin']);
	if (countAdmin != null) {
		worldEntity.countAdmin = countAdmin;
	}
	final int? countComment = jsonConvert.convert<int>(json['countComment']);
	if (countComment != null) {
		worldEntity.countComment = countComment;
	}
	final int? countDiscuss = jsonConvert.convert<int>(json['countDiscuss']);
	if (countDiscuss != null) {
		worldEntity.countDiscuss = countDiscuss;
	}
	final int? countEdit = jsonConvert.convert<int>(json['countEdit']);
	if (countEdit != null) {
		worldEntity.countEdit = countEdit;
	}
	final int? countElement = jsonConvert.convert<int>(json['countElement']);
	if (countElement != null) {
		worldEntity.countElement = countElement;
	}
	final int? countFllow = jsonConvert.convert<int>(json['countFllow']);
	if (countFllow != null) {
		worldEntity.countFllow = countFllow;
	}
	final int? countLike = jsonConvert.convert<int>(json['countLike']);
	if (countLike != null) {
		worldEntity.countLike = countLike;
	}
	final int? countResident = jsonConvert.convert<int>(json['countResident']);
	if (countResident != null) {
		worldEntity.countResident = countResident;
	}
	final int? countSee = jsonConvert.convert<int>(json['countSee']);
	if (countSee != null) {
		worldEntity.countSee = countSee;
	}
	final int? countStory = jsonConvert.convert<int>(json['countStory']);
	if (countStory != null) {
		worldEntity.countStory = countStory;
	}
	final int? createId = jsonConvert.convert<int>(json['createId']);
	if (createId != null) {
		worldEntity.createId = createId;
	}
	final String? createName = jsonConvert.convert<String>(json['createName']);
	if (createName != null) {
		worldEntity.createName = createName;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		worldEntity.createTime = createTime;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		worldEntity.description = description;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		worldEntity.id = id;
	}
	final String? imgUrl = jsonConvert.convert<String>(json['imgUrl']);
	if (imgUrl != null) {
		worldEntity.imgUrl = imgUrl;
	}
	final String? intro = jsonConvert.convert<String>(json['intro']);
	if (intro != null) {
		worldEntity.intro = intro;
	}
	final int? isPrive = jsonConvert.convert<int>(json['isPrive']);
	if (isPrive != null) {
		worldEntity.isPrive = isPrive;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		worldEntity.name = name;
	}
	final int? ranks = jsonConvert.convert<int>(json['ranks']);
	if (ranks != null) {
		worldEntity.ranks = ranks;
	}
	final int? scores = jsonConvert.convert<int>(json['scores']);
	if (scores != null) {
		worldEntity.scores = scores;
	}
	final String? xSource = jsonConvert.convert<String>(json['source']);
	if (xSource != null) {
		worldEntity.xSource = xSource;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		worldEntity.status = status;
	}
	final String? typeName = jsonConvert.convert<String>(json['typeName']);
	if (typeName != null) {
		worldEntity.typeName = typeName;
	}
	final int? types = jsonConvert.convert<int>(json['types']);
	if (types != null) {
		worldEntity.types = types;
	}
	final int? updateId = jsonConvert.convert<int>(json['updateId']);
	if (updateId != null) {
		worldEntity.updateId = updateId;
	}
	final String? updateName = jsonConvert.convert<String>(json['updateName']);
	if (updateName != null) {
		worldEntity.updateName = updateName;
	}
	final String? updateNewElement = jsonConvert.convert<String>(json['updateNewElement']);
	if (updateNewElement != null) {
		worldEntity.updateNewElement = updateNewElement;
	}
	final int? updateNewElementId = jsonConvert.convert<int>(json['updateNewElementId']);
	if (updateNewElementId != null) {
		worldEntity.updateNewElementId = updateNewElementId;
	}
	final String? updateNewElementTime = jsonConvert.convert<String>(json['updateNewElementTime']);
	if (updateNewElementTime != null) {
		worldEntity.updateNewElementTime = updateNewElementTime;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		worldEntity.updateTime = updateTime;
	}
	final int? vitality = jsonConvert.convert<int>(json['vitality']);
	if (vitality != null) {
		worldEntity.vitality = vitality;
	}
	return worldEntity;
}

Map<String, dynamic> $WorldEntityToJson(WorldEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['countAddType'] = entity.countAddType;
	data['countAdmin'] = entity.countAdmin;
	data['countComment'] = entity.countComment;
	data['countDiscuss'] = entity.countDiscuss;
	data['countEdit'] = entity.countEdit;
	data['countElement'] = entity.countElement;
	data['countFllow'] = entity.countFllow;
	data['countLike'] = entity.countLike;
	data['countResident'] = entity.countResident;
	data['countSee'] = entity.countSee;
	data['countStory'] = entity.countStory;
	data['createId'] = entity.createId;
	data['createName'] = entity.createName;
	data['createTime'] = entity.createTime;
	data['description'] = entity.description;
	data['id'] = entity.id;
	data['imgUrl'] = entity.imgUrl;
	data['intro'] = entity.intro;
	data['isPrive'] = entity.isPrive;
	data['name'] = entity.name;
	data['ranks'] = entity.ranks;
	data['scores'] = entity.scores;
	data['source'] = entity.xSource;
	data['status'] = entity.status;
	data['typeName'] = entity.typeName;
	data['types'] = entity.types;
	data['updateId'] = entity.updateId;
	data['updateName'] = entity.updateName;
	data['updateNewElement'] = entity.updateNewElement;
	data['updateNewElementId'] = entity.updateNewElementId;
	data['updateNewElementTime'] = entity.updateNewElementTime;
	data['updateTime'] = entity.updateTime;
	data['vitality'] = entity.vitality;
	return data;
}