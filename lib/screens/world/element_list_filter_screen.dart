import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:xinshijieapp/components/element_detail_component.dart';
import 'package:xinshijieapp/data/category_data_utils.dart';
import 'package:xinshijieapp/models/element_entity.dart';
import 'package:xinshijieapp/utils/space.dart';


class ElementListFilterScreen extends StatefulWidget {
  ElementListFilterScreen({Key? key,required this.wid}) : super(key: key);
  int wid;

  @override
  State<ElementListFilterScreen> createState() => _ElementListFilterScreenState();
}

class _ElementListFilterScreenState extends State<ElementListFilterScreen> {
  late List<BrnSelectionEntity> listBrn;
  late BrnSelectionEntity typeSlection;
  List<BrnSelectionEntity>? typeSelec= <BrnSelectionEntity>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 显式类型转换, List<dynamic>   ->  List<Map<String, dynamic>>
    print("-------------listbean--------");
    listBrn = <BrnSelectionEntity>[];
    typeSlection=new BrnSelectionEntity(title:"分类",key:"type-list-key",type:"radio");
    listBrn.add(typeSlection);
    getTree();
  }

  @override
  void didUpdateWidget(covariant ElementListFilterScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  void getTree()  {
    CategoryDataUtils.getTree(widget.wid,success: (res) {
      setState(() {
        List<Map<String, dynamic>> listMap = new List<Map<String, dynamic>>.from(res['data']);
        for (int i = 0; i < listMap.length; i++) {
          BrnSelectionEntity dd= BrnSelectionEntity.fromMap(listMap[i]);
          typeSelec?.add(dd);
        }
        typeSlection.children=typeSelec!;
      });
    }, fail: (code, msg) {});
  }
  @override
  Widget build(BuildContext context) {
    List<String> tagList = [
      '全部',
      '标签信息',
      '标签信息标签信息',
      '标签信息',
      '其他'
    ];

    return  Expanded(
        child: Column(
            children:[
              Space(8),
              BrnSelectTag(
                  tags: tagList,
                  tagWidth: 40,
                  softWrap: false,
                  initTagState: const [true],
                  onSelect: (index) {
                    BrnToast.show("$index is selected", context);
                  }),
              Space(8),
              BrnSelectTag(
                  tags: tagList,
                  tagWidth: 40,
                  softWrap: false,
                  initTagState:[true],
                  onSelect: (index) {
                    BrnToast.show("$index is selected", context);
                  }),
              Space(8),
              BrnSelectTag(
                  tags: tagList,
                  tagWidth: 40,
                  softWrap: false,
                  initTagState:[true],
                  onSelect: (index) {
                    BrnToast.show("$index is selected", context);
                  })
            ]
        )

    );
  }

}
