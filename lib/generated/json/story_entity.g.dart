import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/story_entity.dart';

StoryEntity $StoryEntityFromJson(Map<String, dynamic> json) {
	final StoryEntity storyEntity = StoryEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		storyEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		storyEntity.name = name;
	}
	final String? intro = jsonConvert.convert<String>(json['intro']);
	if (intro != null) {
		storyEntity.intro = intro;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		storyEntity.description = description;
	}
	final int? permission = jsonConvert.convert<int>(json['permission']);
	if (permission != null) {
		storyEntity.permission = permission;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		storyEntity.author = author;
	}
	final int? category = jsonConvert.convert<int>(json['category']);
	if (category != null) {
		storyEntity.category = category;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		storyEntity.status = status;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		storyEntity.createTime = createTime;
	}
	final int? createId = jsonConvert.convert<int>(json['createId']);
	if (createId != null) {
		storyEntity.createId = createId;
	}
	final String? createName = jsonConvert.convert<String>(json['createName']);
	if (createName != null) {
		storyEntity.createName = createName;
	}
	final String? updateName = jsonConvert.convert<String>(json['updateName']);
	if (updateName != null) {
		storyEntity.updateName = updateName;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		storyEntity.updateTime = updateTime;
	}
	final int? updateId = jsonConvert.convert<int>(json['updateId']);
	if (updateId != null) {
		storyEntity.updateId = updateId;
	}
	final String? tags = jsonConvert.convert<String>(json['tags']);
	if (tags != null) {
		storyEntity.tags = tags;
	}
	final String? updateChapter = jsonConvert.convert<String>(json['updateChapter']);
	if (updateChapter != null) {
		storyEntity.updateChapter = updateChapter;
	}
	final int? updateChapterId = jsonConvert.convert<int>(json['updateChapterId']);
	if (updateChapterId != null) {
		storyEntity.updateChapterId = updateChapterId;
	}
	final String? updateChapterTime = jsonConvert.convert<String>(json['updateChapterTime']);
	if (updateChapterTime != null) {
		storyEntity.updateChapterTime = updateChapterTime;
	}
	final int? exp = jsonConvert.convert<int>(json['exp']);
	if (exp != null) {
		storyEntity.exp = exp;
	}
	final int? ranks = jsonConvert.convert<int>(json['ranks']);
	if (ranks != null) {
		storyEntity.ranks = ranks;
	}
	final int? types = jsonConvert.convert<int>(json['types']);
	if (types != null) {
		storyEntity.types = types;
	}
	final String? typeName = jsonConvert.convert<String>(json['typeName']);
	if (typeName != null) {
		storyEntity.typeName = typeName;
	}
	final int? auditNumber = jsonConvert.convert<int>(json['auditNumber']);
	if (auditNumber != null) {
		storyEntity.auditNumber = auditNumber;
	}
	final String? auditContent = jsonConvert.convert<String>(json['auditContent']);
	if (auditContent != null) {
		storyEntity.auditContent = auditContent;
	}
	final int? countWord = jsonConvert.convert<int>(json['countWord']);
	if (countWord != null) {
		storyEntity.countWord = countWord;
	}
	final String? imgUrl = jsonConvert.convert<String>(json['imgUrl']);
	if (imgUrl != null) {
		storyEntity.imgUrl = imgUrl;
	}
	final int? isVip = jsonConvert.convert<int>(json['isVip']);
	if (isVip != null) {
		storyEntity.isVip = isVip;
	}
	final int? wid = jsonConvert.convert<int>(json['wid']);
	if (wid != null) {
		storyEntity.wid = wid;
	}
	final String? wname = jsonConvert.convert<String>(json['wname']);
	if (wname != null) {
		storyEntity.wname = wname;
	}
	final int? auditId = jsonConvert.convert<int>(json['auditId']);
	if (auditId != null) {
		storyEntity.auditId = auditId;
	}
	final String? auditName = jsonConvert.convert<String>(json['auditName']);
	if (auditName != null) {
		storyEntity.auditName = auditName;
	}
	final String? auditTime = jsonConvert.convert<String>(json['auditTime']);
	if (auditTime != null) {
		storyEntity.auditTime = auditTime;
	}
	final String? endTime = jsonConvert.convert<String>(json['endTime']);
	if (endTime != null) {
		storyEntity.endTime = endTime;
	}
	final String? xSource = jsonConvert.convert<String>(json['source']);
	if (xSource != null) {
		storyEntity.xSource = xSource;
	}
	final int? countAuthor = jsonConvert.convert<int>(json['countAuthor']);
	if (countAuthor != null) {
		storyEntity.countAuthor = countAuthor;
	}
	final int? countComment = jsonConvert.convert<int>(json['countComment']);
	if (countComment != null) {
		storyEntity.countComment = countComment;
	}
	final int? countDiscuss = jsonConvert.convert<int>(json['countDiscuss']);
	if (countDiscuss != null) {
		storyEntity.countDiscuss = countDiscuss;
	}
	final int? countChapter = jsonConvert.convert<int>(json['countChapter']);
	if (countChapter != null) {
		storyEntity.countChapter = countChapter;
	}
	final int? countEdit = jsonConvert.convert<int>(json['countEdit']);
	if (countEdit != null) {
		storyEntity.countEdit = countEdit;
	}
	final int? countHarding = jsonConvert.convert<int>(json['countHarding']);
	if (countHarding != null) {
		storyEntity.countHarding = countHarding;
	}
	final int? countLike = jsonConvert.convert<int>(json['countLike']);
	if (countLike != null) {
		storyEntity.countLike = countLike;
	}
	final int? countSee = jsonConvert.convert<int>(json['countSee']);
	if (countSee != null) {
		storyEntity.countSee = countSee;
	}
	return storyEntity;
}

Map<String, dynamic> $StoryEntityToJson(StoryEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['intro'] = entity.intro;
	data['description'] = entity.description;
	data['permission'] = entity.permission;
	data['author'] = entity.author;
	data['category'] = entity.category;
	data['status'] = entity.status;
	data['createTime'] = entity.createTime;
	data['createId'] = entity.createId;
	data['createName'] = entity.createName;
	data['updateName'] = entity.updateName;
	data['updateTime'] = entity.updateTime;
	data['updateId'] = entity.updateId;
	data['tags'] = entity.tags;
	data['updateChapter'] = entity.updateChapter;
	data['updateChapterId'] = entity.updateChapterId;
	data['updateChapterTime'] = entity.updateChapterTime;
	data['exp'] = entity.exp;
	data['ranks'] = entity.ranks;
	data['types'] = entity.types;
	data['typeName'] = entity.typeName;
	data['auditNumber'] = entity.auditNumber;
	data['auditContent'] = entity.auditContent;
	data['countWord'] = entity.countWord;
	data['imgUrl'] = entity.imgUrl;
	data['isVip'] = entity.isVip;
	data['wid'] = entity.wid;
	data['wname'] = entity.wname;
	data['auditId'] = entity.auditId;
	data['auditName'] = entity.auditName;
	data['auditTime'] = entity.auditTime;
	data['endTime'] = entity.endTime;
	data['source'] = entity.xSource;
	data['countAuthor'] = entity.countAuthor;
	data['countComment'] = entity.countComment;
	data['countDiscuss'] = entity.countDiscuss;
	data['countChapter'] = entity.countChapter;
	data['countEdit'] = entity.countEdit;
	data['countHarding'] = entity.countHarding;
	data['countLike'] = entity.countLike;
	data['countSee'] = entity.countSee;
	return data;
}