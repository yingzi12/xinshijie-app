import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:xinshijieapp/components/element_detail_component.dart';
import 'package:xinshijieapp/data/category_data_utils.dart';
import 'package:xinshijieapp/models/element_entity.dart';


class ElementListScreen extends StatefulWidget {
  ElementListScreen({Key? key,required this.wid}) : super(key: key);
  int wid;

  @override
  State<ElementListScreen> createState() => _ElementListScreenState();
}

class _ElementListScreenState extends State<ElementListScreen> {
  Map userMap =json.decode('{"list":[{"title":"排序","key":"one_list_key","type":"radio","defaultValue":"","value":"","children":[{"title":"不限","key":"","type":"unlimit","defaultValue":"","value":""},{"title":"创建时间","key":"","type":"radio","defaultValue":"","value":"1"},{"title":"更新时间","key":"","type":"radio","defaultValue":"","value":"2"},{"title":"查看","key":"","type":"radio","defaultValue":"","value":"3"},{"title":"编辑","key":"","type":"radio","defaultValue":"","value":"4"},{"title":"评论","key":"","type":"radio","defaultValue":"","value":"5"}]}]}');
  late List<BrnSelectionEntity> listBrn;
  late BrnSelectionEntity typeSlection;
  List<ElementEntity>? elementList;
  List<BrnSelectionEntity>? typeSelec;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var listDynamic =userMap['list'];
    /// 显式类型转换, List<dynamic>   ->  List<Map<String, dynamic>>
    List<Map<String, dynamic>> listMap = new List<Map<String, dynamic>>.from(listDynamic);
    print("-------------listbean--------");
    listBrn = <BrnSelectionEntity>[];
    for (int i = 0; i < listMap.length; i++) {
      BrnSelectionEntity dd= BrnSelectionEntity.fromMap(listMap[i]);
      listBrn.add(dd);
    }
    typeSlection=new BrnSelectionEntity(title:"分类",key:"type-list-key",type:"radio");
    listBrn.add(typeSlection);
    getTree();
  }

  @override
  void didUpdateWidget(covariant ElementListScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  void getTree()  {
    CategoryDataUtils.getTree(widget.wid,success: (res) {
      setState(() {
        List<Map<String, dynamic>> listMap = new List<Map<String, dynamic>>.from(res['data']);
        typeSelec= <BrnSelectionEntity>[];
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
    return Scaffold(
      appBar: AppBar(
          title:BrnSearchText()
      ),
      body: Column(
        children: [
          BrnSelectionView(
            originalSelectionData: listBrn,
            onMoreSelectionMenuClick: (int index, BrnOpenMorePage openMore) {
              /// 手动触发打开更多筛选页面
              openMore(updateData: false);
            },
            onSelectionChanged: (int menuIndex,
                Map<String, String> filterParams,
                Map<String, String> customParams,
                BrnSetCustomSelectionMenuTitle setCustomTitleFunction) {},
          ),
          Expanded(child:  buildView(context),
          ),
      ],
      ),
    );
  }

  @override
  Widget buildView(BuildContext context) {
    print("buildView:");
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      //因为列表项都是一个 ListTile，高度相同，但是我们不知道 ListTile 的高度是多少，所以指定了prototypeItem
      prototypeItem: const Card(
        child: ListTile(
          leading: FlutterLogo(size: 72.0),
          title: Text(
            'Three-line ListTile ',
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              'A sufficiently long subtitle warrants three lines warrants three lines warrants three lines.'),
        ),
      ),
      itemCount: elementList!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onDoubleTap: () {
            onCardTapped(index);
          },
          child:
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(
                elementList![index].wname ?? "",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  elementList![index].intro ?? ""),
            ),
          ),
        );
      },
    );
  }


  onCardTapped(int position) {
    print("card $position");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ElementDetailComponent(),
      ),
    );
  }
}
