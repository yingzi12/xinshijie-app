
/**
 * {
    "id": 1296269,
    "name": "Hello-World", //项目名称
    "full_name": "octocat/Hello-World", //项目完整名称
    "owner": "$user", // 项目拥有者，结构见"user.json"
    "parent?":"$repo", // 如果是fork的项目，则此字段表示fork的父项目信息
    "private": false, // 是否私有项目
    "description": "This your first repo!", //项目描述
    "fork": false, // 该项目是否为fork的项目
    "language?": "JavaScript",//该项目的主要编程语言
    "forks_count": 9, // fork了该项目的数量
    "stargazers_count": 80, //该项目的star数量
    "size": 108, // 项目占用的存储大小
    "default_branch": "master", //项目的默认分支
    "open_issues_count": 2, //该项目当前打开的issue数量
    "pushed_at": "2011-01-26T19:06:43Z",
    "created_at": "2011-01-26T19:01:12Z",
    "updated_at": "2011-01-26T19:14:43Z",
    "subscribers_count?": 42, //订阅（关注）该项目的人数
    "license?": { // 该项目的开源许可证
    "key": "mit",
    "name": "MIT License",
    "spdx_id": "MIT",
    "url": "https://api.github.com/licenses/mit",
    "node_id": "MDc6TGljZW5zZW1pdA=="
    }
    }
 */
class Repo {
  Repo({
      required this.id,
    required this.name,
    required   this.fullName,
    required   this.owner,
    required   this.parent,
    required  this.private,
    required    this.description,
    required   this.fork,
    required   this.language,
    required   this.forksCount,
    required   this.stargazersCount,
    required   this.size,
    required  this.defaultBranch,
    required  this.openIssuesCount,
    required   this.pushedAt,
    required   this.createdAt,
    required  this.updatedAt,
      this.subscribersCount,
    });

  Repo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = json['owner'];
    parent = json['parent?'];
    private = json['private'];
    description = json['description'];
    fork = json['fork'];
    language = json['language?'];
    forksCount = json['forks_count'];
    stargazersCount = json['stargazers_count'];
    size = json['size'];
    defaultBranch = json['default_branch'];
    openIssuesCount = json['open_issues_count'];
    pushedAt = json['pushed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subscribersCount = json['subscribers_count?'];
  }
  int? id;
  String? name;
  String? fullName;
  String? owner;
  String? parent;
  bool? private;
  String? description;
  bool? fork;
  String? language;
  int? forksCount;
  int? stargazersCount;
  int? size;
  String? defaultBranch;
  int? openIssuesCount;
  String? pushedAt;
  String? createdAt;
  String? updatedAt;
  int? subscribersCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['full_name'] = fullName;
    map['owner'] = owner;
    map['parent?'] = parent;
    map['private'] = private;
    map['description'] = description;
    map['fork'] = fork;
    map['language?'] = language;
    map['forks_count'] = forksCount;
    map['stargazers_count'] = stargazersCount;
    map['size'] = size;
    map['default_branch'] = defaultBranch;
    map['open_issues_count'] = openIssuesCount;
    map['pushed_at'] = pushedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['subscribers_count?'] = subscribersCount;
    return map;
  }

}