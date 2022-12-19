import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/comments_entity.dart';

CommentsEntity $CommentsEntityFromJson(Map<String, dynamic> json) {
	final CommentsEntity commentsEntity = CommentsEntity();
	final String? circleUrl = jsonConvert.convert<String>(json['circleUrl']);
	if (circleUrl != null) {
		commentsEntity.circleUrl = circleUrl;
	}
	final String? comment = jsonConvert.convert<String>(json['comment']);
	if (comment != null) {
		commentsEntity.comment = comment;
	}
	final int? countDisagree = jsonConvert.convert<int>(json['countDisagree']);
	if (countDisagree != null) {
		commentsEntity.countDisagree = countDisagree;
	}
	final int? countLike = jsonConvert.convert<int>(json['countLike']);
	if (countLike != null) {
		commentsEntity.countLike = countLike;
	}
	final int? countReply = jsonConvert.convert<int>(json['countReply']);
	if (countReply != null) {
		commentsEntity.countReply = countReply;
	}
	final int? createId = jsonConvert.convert<int>(json['createId']);
	if (createId != null) {
		commentsEntity.createId = createId;
	}
	final String? createName = jsonConvert.convert<String>(json['createName']);
	if (createName != null) {
		commentsEntity.createName = createName;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		commentsEntity.createTime = createTime;
	}
	final int? eid = jsonConvert.convert<int>(json['eid']);
	if (eid != null) {
		commentsEntity.eid = eid;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		commentsEntity.id = id;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		commentsEntity.nickname = nickname;
	}
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		commentsEntity.page = page;
	}
	final int? pid = jsonConvert.convert<int>(json['pid']);
	if (pid != null) {
		commentsEntity.pid = pid;
	}
	final int? ranks = jsonConvert.convert<int>(json['ranks']);
	if (ranks != null) {
		commentsEntity.ranks = ranks;
	}
	final String? reply = jsonConvert.convert<String>(json['reply']);
	if (reply != null) {
		commentsEntity.reply = reply;
	}
	final String? replyNickname = jsonConvert.convert<String>(json['replyNickname']);
	if (replyNickname != null) {
		commentsEntity.replyNickname = replyNickname;
	}
	final int? sid = jsonConvert.convert<int>(json['sid']);
	if (sid != null) {
		commentsEntity.sid = sid;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		commentsEntity.size = size;
	}
	final String? sname = jsonConvert.convert<String>(json['sname']);
	if (sname != null) {
		commentsEntity.sname = sname;
	}
	final int? xSource = jsonConvert.convert<int>(json['source']);
	if (xSource != null) {
		commentsEntity.xSource = xSource;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		commentsEntity.status = status;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		commentsEntity.title = title;
	}
	final int? types = jsonConvert.convert<int>(json['types']);
	if (types != null) {
		commentsEntity.types = types;
	}
	final int? updateId = jsonConvert.convert<int>(json['updateId']);
	if (updateId != null) {
		commentsEntity.updateId = updateId;
	}
	final String? updateName = jsonConvert.convert<String>(json['updateName']);
	if (updateName != null) {
		commentsEntity.updateName = updateName;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		commentsEntity.updateTime = updateTime;
	}
	final int? upid = jsonConvert.convert<int>(json['upid']);
	if (upid != null) {
		commentsEntity.upid = upid;
	}
	final int? wid = jsonConvert.convert<int>(json['wid']);
	if (wid != null) {
		commentsEntity.wid = wid;
	}
	final String? wname = jsonConvert.convert<String>(json['wname']);
	if (wname != null) {
		commentsEntity.wname = wname;
	}
	final int? isRecommend = jsonConvert.convert<int>(json['isRecommend']);
	if (isRecommend != null) {
		commentsEntity.isRecommend = isRecommend;
	}
	return commentsEntity;
}

Map<String, dynamic> $CommentsEntityToJson(CommentsEntity entity) {
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
	data['pid'] = entity.pid;
	data['ranks'] = entity.ranks;
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
	data['upid'] = entity.upid;
	data['wid'] = entity.wid;
	data['wname'] = entity.wname;
	data['isRecommend'] = entity.isRecommend;
	return data;
}