import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? searchValue = jsonConvert.convert<String>(json['searchValue']);
	if (searchValue != null) {
		userEntity.searchValue = searchValue;
	}
	final String? createBy = jsonConvert.convert<String>(json['createBy']);
	if (createBy != null) {
		userEntity.createBy = createBy;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		userEntity.createTime = createTime;
	}
	final int? createId = jsonConvert.convert<int>(json['createId']);
	if (createId != null) {
		userEntity.createId = createId;
	}
	final String? createName = jsonConvert.convert<String>(json['createName']);
	if (createName != null) {
		userEntity.createName = createName;
	}
	final String? updateBy = jsonConvert.convert<String>(json['updateBy']);
	if (updateBy != null) {
		userEntity.updateBy = updateBy;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		userEntity.updateTime = updateTime;
	}
	final String? updateName = jsonConvert.convert<String>(json['updateName']);
	if (updateName != null) {
		userEntity.updateName = updateName;
	}
	final int? updateId = jsonConvert.convert<int>(json['updateId']);
	if (updateId != null) {
		userEntity.updateId = updateId;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		userEntity.remark = remark;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		userEntity.userId = userId;
	}
	final int? deptId = jsonConvert.convert<int>(json['deptId']);
	if (deptId != null) {
		userEntity.deptId = deptId;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		userEntity.userName = userName;
	}
	final String? nickName = jsonConvert.convert<String>(json['nickName']);
	if (nickName != null) {
		userEntity.nickName = nickName;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userEntity.email = email;
	}
	final String? phonenumber = jsonConvert.convert<String>(json['phonenumber']);
	if (phonenumber != null) {
		userEntity.phonenumber = phonenumber;
	}
	final String? sex = jsonConvert.convert<String>(json['sex']);
	if (sex != null) {
		userEntity.sex = sex;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		userEntity.avatar = avatar;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		userEntity.password = password;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		userEntity.status = status;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['searchValue'] = entity.searchValue;
	data['createBy'] = entity.createBy;
	data['createTime'] = entity.createTime;
	data['createId'] = entity.createId;
	data['createName'] = entity.createName;
	data['updateBy'] = entity.updateBy;
	data['updateTime'] = entity.updateTime;
	data['updateName'] = entity.updateName;
	data['updateId'] = entity.updateId;
	data['remark'] = entity.remark;
	data['userId'] = entity.userId;
	data['deptId'] = entity.deptId;
	data['userName'] = entity.userName;
	data['nickName'] = entity.nickName;
	data['email'] = entity.email;
	data['phonenumber'] = entity.phonenumber;
	data['sex'] = entity.sex;
	data['avatar'] = entity.avatar;
	data['password'] = entity.password;
	data['status'] = entity.status;
	return data;
}