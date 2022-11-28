import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/models/AppModel.dart';


Future<AppTheme> getAllAppsAndThemes() async {
  AppTheme appTheme = AppTheme();

  // appTheme.worldManage = getWorldManage();
  // appTheme.storyManage = getStoryManage();
  // appTheme.comment = getComment();

  return appTheme;
}

List<ProTheme> getWorldManage() {
  List<ProTheme> list = [];

  // list.add(ProTheme(name: '编辑', title_name: '编辑世界', tag: '', show_cover: true, widget: MWWorldEditScreen(), darkThemeSupported: true));
  // list.add(ProTheme(name: '创造者', title_name: '创造者', type: '', show_cover: true, widget: MWWorldManageScreen(), darkThemeSupported: true));
  // list.add(ProTheme(name: '分类', title_name: '分类', type: '', show_cover: true, widget: MWWorldTypeScreen(), darkThemeSupported: true));
  // list.add(ProTheme(name: '元素', title_name: '元素', tag: '', type: '', show_cover: true, widget: MWWorldElementScreen(), darkThemeSupported: true));
  // list.add(ProTheme(name: '审核', title_name: '审核', type: '', show_cover: true, widget: MWWorldAuditScreen(), darkThemeSupported: true));
  // list.add(ProTheme(name: '居民', title_name: '居民', type: '', show_cover: true, widget: MWWorldResidentScreen(), darkThemeSupported: true));
  // list.add(ProTheme(name: '故事', title_name: '故事', type: '', show_cover: true, widget: MWWorldStoryScreen(), darkThemeSupported: true));
  // list.add(ProTheme(name: '评论', title_name: '评论', type: '', show_cover: true, widget: MWWorldCommentScreen(), darkThemeSupported: true));
  // list.add(ProTheme(name: '讨论', title_name: '讨论', type: '', show_cover: true, widget: MWWorldDiscussScreen(), darkThemeSupported: true));
  return list;
}


List<ProTheme> getStoryManage() {
  List<ProTheme> list = [];
  return list;
}

ProTheme getComment() {
  ProTheme theme = ProTheme(name: "Full Apps", tag: 'New', show_cover: true, sub_kits: []);
  return theme;
}

