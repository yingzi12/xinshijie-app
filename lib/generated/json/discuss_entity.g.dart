import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/discuss_entity.dart';

DiscussEntity $DiscussEntityFromJson(Map<String, dynamic> json) {
	final DiscussEntity discussEntity = DiscussEntity();
	final String? circleUrl = jsonConvert.convert<String>(json['circleUrl']);
	if (circleUrl != null) {
		discussEntity.circleUrl = circleUrl;
	}
	final String? comment = jsonConvert.convert<String>(json['comment']);
	if (comment != null) {
		discussEntity.comment = comment;
	}
	final int? countDisagree = jsonConvert.convert<int>(json['countDisagree']);
	if (countDisagree != null) {
		discussEntity.countDisagree = countDisagree;
	}
	final int? countLike = jsonConvert.convert<int>(json['countLike']);
	if (countLike != null) {
		discussEntity.countLike = countLike;
	}
	final int? countReply = jsonConvert.convert<int>(json['countReply']);
	if (countReply != null) {
		discussEntity.countReply = countReply;
	}
	final int? createId = jsonConvert.convert<int>(json['createId']);
	if (createId != null) {
		discussEntity.createId = createId;
	}
	final String? createName = jsonConvert.convert<String>(json['createName']);
	if (createName != null) {
		discussEntity.createName = createName;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		discussEntity.createTime = createTime;
	}
	final int? eid = jsonConvert.convert<int>(json['eid']);
	if (eid != null) {
		discussEntity.eid = eid;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		discussEntity.id = id;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		discussEntity.nickname = nickname;
	}
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		discussEntity.page = page;
	}
	final String? reply = jsonConvert.convert<String>(json['reply']);
	if (reply != null) {
		discussEntity.reply = reply;
	}
	final String? replyNickname = jsonConvert.convert<String>(json['replyNickname']);
	if (replyNickname != null) {
		discussEntity.replyNickname = replyNickname;
	}
	final int? sid = jsonConvert.convert<int>(json['sid']);
	if (sid != null) {
		discussEntity.sid = sid;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		discussEntity.size = size;
	}
	final String? sname = jsonConvert.convert<String>(json['sname']);
	if (sname != null) {
		discussEntity.sname = sname;
	}
	final int? xSource = jsonConvert.convert<int>(json['source']);
	if (xSource != null) {
		discussEntity.xSource = xSource;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		discussEntity.status = status;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		discussEntity.title = title;
	}
	final int? types = jsonConvert.convert<int>(json['types']);
	if (types != null) {
		discussEntity.types = types;
	}
	final int? updateId = jsonConvert.convert<int>(json['updateId']);
	if (updateId != null) {
		discussEntity.updateId = updateId;
	}
	final String? updateName = jsonConvert.convert<String>(json['updateName']);
	if (updateName != null) {
		discussEntity.updateName = updateName;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		discussEntity.updateTime = updateTime;
	}
	final int? wid = jsonConvert.convert<int>(json['wid']);
	if (wid != null) {
		discussEntity.wid = wid;
	}
	final String? wname = jsonConvert.convert<String>(json['wname']);
	if (wname != null) {
		discussEntity.wname = wname;
	}
	return discussEntity;
}

Map<String, dynamic> $DiscussEntityToJson(DiscussEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['circleUrl'] = entity.circleUrl;
	data['comment'] = entity.comment;
	data['countDisagree'] = entity.countDisagree;
	data['countLike'] = entity.countLike;
	data['countReply'] = entity.countReply;
	data['createId'] = entity.createId;
	data['createName'] = entity.createName;
	data['createTime'] = entity.createTime;
	data['eid'] = entity.eid;
	data['id'] = entity.id;
	data['nickname'] = entity.nickname;
	data['page'] = entity.page;
	data['reply'] = entity.reply;
	data['replyNickname'] = entity.replyNickname;
	data['sid'] = entity.sid;
	data['size'] = entity.size;
	data['sname'] = entity.sname;
	data['source'] = entity.xSource;
	data['status'] = entity.status;
	data['title'] = entity.title;
	data['types'] = entity.types;
	data['updateId'] = entity.updateId;
	data['updateName'] = entity.updateName;
	data['updateTime'] = entity.updateTime;
	data['wid'] = entity.wid;
	data['wname'] = entity.wname;
	return data;
}