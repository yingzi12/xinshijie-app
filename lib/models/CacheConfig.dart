/**
 * {
    "enable":true, // 是否启用缓存
    "maxAge":1000, // 缓存的最长时间，单位（秒）
    "maxCount":100 // 最大缓存数
    }
 */
class CacheConfig {
  CacheConfig({
       required this.enable,
       required this.maxAge,
       required this.maxCount,});

  CacheConfig.fromJson(dynamic json) {
    enable = json['enable'];
    maxAge = json['maxAge'];
    maxCount = json['maxCount'];
  }

  bool enable=true;
  int maxAge=1000;
  int maxCount=1000;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enable'] = enable;
    map['maxAge'] = maxAge;
    map['maxCount'] = maxCount;
    return map;
  }

}