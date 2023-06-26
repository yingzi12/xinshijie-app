import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xinshijieapp/screens/world/element_detail_component.dart';
import 'package:xinshijieapp/data/element_data_utils.dart';
import 'package:xinshijieapp/models/element_entity.dart';


class ElementListContentScreen extends StatefulWidget {
  ElementListContentScreen({Key? key,required this.wid}) : super(key: key);
  int wid;

  @override
  State<ElementListContentScreen> createState() => _ElementListContentScreenState();
}

class _ElementListContentScreenState extends State<ElementListContentScreen> {
  List<ElementEntity>? elementList;
  @override
  void initState() {
    print("---------------_WorldCommnetScreen- initState-----------------");
    // TODO: implement initState
    super.initState();
    init();
  }


  Future<void> init() async {
    getElementList();
  }
  void getElementList()  {
    ElementDataUtils.getPageList({'pageNum': 1, 'pageSize': 6,'wid':widget.wid}, success: (res) {
      setState(() {
        elementList = List<ElementEntity>.from(
            res['rows'].map((x) => ElementEntity.fromJson(x)));
        if(elementList == null){
          elementList= List.empty();
        }
      });
    }, fail: (code, msg) {
    });
  }
  @override
  Widget build(BuildContext context) {
    if( elementList == null){
      return Center(
        child: Text('加载中...'),
      );
    }else{
      print("---------------ElementListContentScreen- build and elementList not -----------------");
    }
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
            onCardTapped(index,elementList![index].id?? 0);
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



  onCardTapped(int position,int _eid) {
    print("card $position");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ElementDetailComponent(wid: widget.wid,eid: _eid,),
      ),
    );
  }
}
