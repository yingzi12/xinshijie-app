import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/captcha_entity.dart';

CaptchaEntity $CaptchaEntityFromJson(Map<String, dynamic> json) {
	final CaptchaEntity captchaEntity = CaptchaEntity();
	final String? uuid = jsonConvert.convert<String>(json['uuid']);
	if (uuid != null) {
		captchaEntity.uuid = uuid;
	}
	final String? img = jsonConvert.convert<String>(json['img']);
	if (img != null) {
		captchaEntity.img = img;
	}
	final bool? captchaEnabled = jsonConvert.convert<bool>(json['captchaEnabled']);
	if (captchaEnabled != null) {
		captchaEntity.captchaEnabled = captchaEnabled;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		captchaEntity.code = code;
	}
	return captchaEntity;
}

Map<String, dynamic> $CaptchaEntityToJson(CaptchaEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['uuid'] = entity.uuid;
	data['img'] = entity.img;
	data['captchaEnabled'] = entity.captchaEnabled;
	data['code'] = entity.code;
	return data;
}