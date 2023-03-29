
import 'package:xinshijieapp/utils/tree_pro/flutter_tree_pro.dart';

/// @create at 2021/7/15 15:01
/// @create by kevin
/// @desc

class DataUtil {
  /// @params3 = {_Map} size = 5
  /// @desc  List to map72 = {_Map} size = 6
  static Map<String, dynamic> transformListToMap(List dataList, Config config) {
    Map<String, dynamic> obj = {};
    Map<String, dynamic> root={};
    root["id"]="0";
    root["value"]="全部";
    root["label"]="全部";
    root["parentId"]= "-1" ;
    dataList.add(root);
    List<int> rootIds=[];
    dataList.forEach((v) {
      // 根节点
      if (v[config.parentId] != -1) {
        if (obj[v[config.parentId]] != null) {
          if (obj[v[config.parentId]][config.children] != null) {
            obj[v[config.parentId]][config.children].add(v);
          } else {
            obj[v[config.parentId]][config.children] = [v];
          }
        } else {
          obj[v[config.parentId]] = {
            config.children: [v],
          };
        }
      } else {
        rootIds.add(v[config.id]);
      }
      if (obj[v[config.id]] != null) {
        v[config.children] = obj[v[config.id]][config.children];
      }
      obj[v[config.id]] = v;
    });
    return obj["0"];
  }

  /// @params
  /// @desc expand tree map
  Map<String, dynamic> expandMap(Map<String, dynamic> dataMap, Config config) {
    dataMap['open'] = false;
    dataMap['checked'] = 0;
    dataMap.putIfAbsent(dataMap[config.id], () => dataMap);
    (dataMap[config.children] ?? []).forEach((element) {
      expandMap(element, config);
    });
    return {"aaa": ""};
  }

  /// @params
  /// @desc 将树形结构数据平铺开
  // factoryTreeData(treeModel ,Config config) {
  //   treeModel['open'] = false;
  //   treeModel['checked'] = 0;
  //   treeMap.putIfAbsent(treeModel[config.id], () => treeModel);
  //   (treeModel[config.children] ?? []).forEach((element) {
  //     factoryTreeData(element);
  //   });
  // }
}
