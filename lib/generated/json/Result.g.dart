import 'package:xinshijieapp/generated/json/base/json_convert_content.dart';
import 'package:xinshijieapp/models/Result.dart';
import 'package:json_annotation/json_annotation.dart';


Result $ResultFromJson(Map<String, dynamic> json) {
	final Result result = Result();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		result.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		result.msg = msg;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		result.total = total;
	}
	return result;
}

Map<String, dynamic> $ResultToJson(Result entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['total'] = entity.total;
	return data;
}