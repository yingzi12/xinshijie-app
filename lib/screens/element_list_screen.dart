import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xinshijieapp/screens/world/element_list_content_screen.dart';
import 'package:xinshijieapp/screens/world/element_list_filter_screen.dart';


class ElementListScreen extends StatefulWidget {
  ElementListScreen({Key? key,required this.wid}) : super(key: key);
  int wid;

  @override
  State<ElementListScreen> createState() => _ElementListScreenState();
}

class _ElementListScreenState extends State<ElementListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void didUpdateWidget(covariant ElementListScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("元素信息"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
            ElementListFilterScreen(wid: widget.wid),
            Expanded(child: ElementListContentScreen(wid: widget.wid),
          ),
      ],
      ),
    );
  }

}
