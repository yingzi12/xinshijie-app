import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/users_entity.dart';

UsersEntity $UsersEntityFromJson(Map<String, dynamic> json) {
	final UsersEntity usersEntity = UsersEntity();
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		usersEntity.userId = userId;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		usersEntity.userName = userName;
	}
	final String? nickName = jsonConvert.convert<String>(json['nickName']);
	if (nickName != null) {
		usersEntity.nickName = nickName;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		usersEntity.email = email;
	}
	final int? isEmail = jsonConvert.convert<int>(json['isEmail']);
	if (isEmail != null) {
		usersEntity.isEmail = isEmail;
	}
	final String? phonenumber = jsonConvert.convert<String>(json['phonenumber']);
	if (phonenumber != null) {
		usersEntity.phonenumber = phonenumber;
	}
	final String? sex = jsonConvert.convert<String>(json['sex']);
	if (sex != null) {
		usersEntity.sex = sex;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		usersEntity.avatar = avatar;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		usersEntity.status = status;
	}
	final String? delFlag = jsonConvert.convert<String>(json['delFlag']);
	if (delFlag != null) {
		usersEntity.delFlag = delFlag;
	}
	final String? loginIp = jsonConvert.convert<String>(json['loginIp']);
	if (loginIp != null) {
		usersEntity.loginIp = loginIp;
	}
	final String? loginDate = jsonConvert.convert<String>(json['loginDate']);
	if (loginDate != null) {
		usersEntity.loginDate = loginDate;
	}
	final int? ranks = jsonConvert.convert<int>(json['ranks']);
	if (ranks != null) {
		usersEntity.ranks = ranks;
	}
	final int? exp = jsonConvert.convert<int>(json['exp']);
	if (exp != null) {
		usersEntity.exp = exp;
	}
	final String? tags = jsonConvert.convert<String>(json['tags']);
	if (tags != null) {
		usersEntity.tags = tags;
	}
	final int? money = jsonConvert.convert<int>(json['money']);
	if (money != null) {
		usersEntity.money = money;
	}
	final String? sign = jsonConvert.convert<String>(json['sign']);
	if (sign != null) {
		usersEntity.sign = sign;
	}
	final int? countChapter = jsonConvert.convert<int>(json['countChapter']);
	if (countChapter != null) {
		usersEntity.countChapter = countChapter;
	}
	final int? countComment = jsonConvert.convert<int>(json['countComment']);
	if (countComment != null) {
		usersEntity.countComment = countComment;
	}
	final int? countDiscuss = jsonConvert.convert<int>(json['countDiscuss']);
	if (countDiscuss != null) {
		usersEntity.countDiscuss = countDiscuss;
	}
	final int? countElement = jsonConvert.convert<int>(json['countElement']);
	if (countElement != null) {
		usersEntity.countElement = countElement;
	}
	final int? countEdit = jsonConvert.convert<int>(json['countEdit']);
	if (countEdit != null) {
		usersEntity.countEdit = countEdit;
	}
	final int? countFllow = jsonConvert.convert<int>(json['countFllow']);
	if (countFllow != null) {
		usersEntity.countFllow = countFllow;
	}
	final int? countHarding = jsonConvert.convert<int>(json['countHarding']);
	if (countHarding != null) {
		usersEntity.countHarding = countHarding;
	}
	final int? countLike = jsonConvert.convert<int>(json['countLike']);
	if (countLike != null) {
		usersEntity.countLike = countLike;
	}
	final int? countWorld = jsonConvert.convert<int>(json['countWorld']);
	if (countWorld != null) {
		usersEntity.countWorld = countWorld;
	}
	final int? countUpdate = jsonConvert.convert<int>(json['countUpdate']);
	if (countUpdate != null) {
		usersEntity.countUpdate = countUpdate;
	}
	final int? countSee = jsonConvert.convert<int>(json['countSee']);
	if (countSee != null) {
		usersEntity.countSee = countSee;
	}
	final int? countStory = jsonConvert.convert<int>(json['countStory']);
	if (countStory != null) {
		usersEntity.countStory = countStory;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		usersEntity.remark = remark;
	}
	return usersEntity;
}

Map<String, dynamic> $UsersEntityToJson(UsersEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userId'] = entity.userId;
	data['userName'] = entity.userName;
	data['nickName'] = entity.nickName;
	data['email'] = entity.email;
	data['isEmail'] = entity.isEmail;
	data['phonenumber'] = entity.phonenumber;
	data['sex'] = entity.sex;
	data['avatar'] = entity.avatar;
	data['status'] = entity.status;
	data['delFlag'] = entity.delFlag;
	data['loginIp'] = entity.loginIp;
	data['loginDate'] = entity.loginDate;
	data['ranks'] = entity.ranks;
	data['exp'] = entity.exp;
	data['tags'] = entity.tags;
	data['money'] = entity.money;
	data['sign'] = entity.sign;
	data['countChapter'] = entity.countChapter;
	data['countComment'] = entity.countComment;
	data['countDiscuss'] = entity.countDiscuss;
	data['countElement'] = entity.countElement;
	data['countEdit'] = entity.countEdit;
	data['countFllow'] = entity.countFllow;
	data['countHarding'] = entity.countHarding;
	data['countLike'] = entity.countLike;
	data['countWorld'] = entity.countWorld;
	data['countUpdate'] = entity.countUpdate;
	data['countSee'] = entity.countSee;
	data['countStory'] = entity.countStory;
	data['remark'] = entity.remark;
	return data;
}