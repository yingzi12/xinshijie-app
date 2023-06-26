import 'dart:async';

import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/data/element_data_utils.dart';
import 'package:xinshijieapp/models/element_entity.dart';
import 'package:xinshijieapp/screens/world/element_detail_component.dart';
import 'package:xinshijieapp/utils/bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:xinshijieapp/components/comment_component.dart';
import 'package:xinshijieapp/data/comments_data_utils.dart';
import 'package:xinshijieapp/models/comments_entity.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/screens/world/world_intro_screen.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/AppWidget.dart';

class ElementListIntroScreen extends StatefulWidget {
   ElementListIntroScreen({Key? key,required this.wid,required this.cid}) : super(key: key);
  int wid;
   int cid;
  @override
  ElementListIntroScreenState createState() {
    return ElementListIntroScreenState();
  }
}

class ElementListIntroScreenState extends State<ElementListIntroScreen>
    with SingleTickerProviderStateMixin {
  var logger = Logger();
  int _count = 0;
  int pageNum = 1;

  late EasyRefreshController _controller;
  List<ElementEntity> elementList=[];

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> init() async {
    getElementList();
  }
  void getElementList()  {
    ElementDataUtils.getPageList({'pageNum':pageNum, 'pageSize': 15,'wid':widget.wid,'types':widget.cid==0 ? null:widget.cid}, success: (res) {
      setState(() {
        List<ElementEntity> elemetList2 = List<ElementEntity>.from(
            res['rows'].map((x) => ElementEntity.fromJson(x)));
        if(elemetList2 != null){
          elementList.addAll(elemetList2);
        }
        elemetList2.clear();
        _count=elementList.length;
      });
    }, fail: (code, msg) {
      print("-----------------_WorldCommnetScreen---- getelemetList fail --------------------");
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return EasyRefresh(
      controller: _controller,
      header: BezierCircleHeader(
        foregroundColor: themeData.scaffoldBackgroundColor,
        backgroundColor: themeData.colorScheme.primary,
      ),
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
        if (!mounted) {
          return;
        }
        setState(() {
          pageNum = 1;
          _count=0;
          elementList.clear();
          getElementList();
          // _count = 10;
        });
        _controller.finishRefresh();
        _controller.resetFooter();
      },
      onLoad: () async {
        await Future.delayed(const Duration(seconds: 2));
        if (!mounted) {
          return;
        }
        setState(() {
          pageNum +=1;
          getElementList();
        });
        _controller.finishLoad(
            _count >= 150 ? IndicatorResult.noMore : IndicatorResult.success);
      },
      child: ListView.builder(
        clipBehavior: Clip.none,
        padding: EdgeInsets.zero,
        itemCount: _count,
        itemBuilder: (ctx, index) {
          return   Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(
                elementList[index].title!,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis, elementList[index].intro!),
              onTap: (){
                ElementDetailComponent(wid: widget.wid,eid:  elementList[index].id!,).launch(context);
              },
            ),
          );
        },
      ),
    );
  }
}
