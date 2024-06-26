import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/screens/world/element_list_intro_screen.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:xinshijieapp/data/category_data_utils.dart';
import 'package:xinshijieapp/models/element_entity.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/tree_pro/flutter_tree_pro.dart';

class ElementList2Screen extends StatefulWidget {
  ElementList2Screen({Key? key, required this.wid}) : super(key: key);
  int wid;
  @override
  ElementList2ScreenState createState() => ElementList2ScreenState();
}

class ElementList2ScreenState extends State<ElementList2Screen> {
  var logger = Logger(
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  );
  List<ElementEntity> elementList = [];
  // List<C> categoryList = [];
  int _count = 0;
  int pageNum = 1;
  int cid=0;
  String cName="全部";

  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    init();
    // loadData();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> init() async {
    getTree();
  }
  List<Map<String, dynamic>> treeListData = [];
  void getTree(){
    CategoryDataUtils.getTree(widget.wid, success: (res) {
      print("查询成功");
      setState(() {
        logger.i(res["data"]);
        treeListData = [];
        res['data'].forEach((x){
                Map<String, dynamic> node={};
                node["id"]=int.parse(x["id"]);
                node["parentId"]=int.parse(x["pid"]);
                node["value"]=x["label"];
                node["label"]=x["label"];
                treeListData.add(node);
        });
        logger.i(treeListData);
      });
    }, fail: (code, msg) {
    print("-----------------_WorldCommnetScreen---- getelemetList fail --------------------");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          //pinnedHeaderSliverHeightBuilder: 在pinnedHeaderSliverHeightBuilder回调中设置全部pinned的header的高度， demo里面高度为 状态栏高度+SliverAppbar的高度
          pinnedHeaderSliverHeightBuilder: () {
            return MediaQuery.of(context).padding.top + kToolbarHeight;
          },
          ///headerSliverBuilder: 在内部滚动视图之前的任何小部件的构建器(由[body]给出)。
          ///通常这是用来创建[SliverAppBar]与[TabBar]。
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                pinned: true,
                title: Text('元素列表',style:TextStyle(color: appTextColorPrimary)),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  // height: 100,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  //     TextButton(onPressed: (){
                  //       // showListDialog();
                  //     }, child: Text("点击选择分类")),
                  //     Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  //       Text("已选择分类:"),
                  //       BrnStateTag(
                  //         tagText: cName,
                  //         tagState: TagState.succeed,
                  //       )
                  //     ]),
                  //
                  //     // Row(
                  //     //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     //     children: [
                  //     //       CircleAvatar(
                  //     //         backgroundImage: AssetImage(widget.elemet.circleUrl!),
                  //     //         radius: 20,
                  //     //       ),
                  //     //       Text(widget.elemet.nickname!, style: boldTextStyle(color:  Color(0xFFFD5530))),
                  //     //     ]),
                  //     // Text(widget.elemet.comment!, style: boldTextStyle()),
                    ],
                  ).expand(flex: 2).paddingLeft(16),
                ),
              ),
            ];
          },
          body: SafeArea(
            child:
            Column(
                children: <Widget>[
                  Expanded(child:
                   ElementListIntroScreen(wid:widget.wid,cid: 0,)
                  ),
                ]),
          )
      ),
    );
  }
  // 构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }


  //默认数据
  List<Map<String, dynamic>> initialTreeData = [];

  Future<void> showListDialog() async {
    getTree();
    if(treeListData.length>0) {
      int? index = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(child:
          Container(
            constraints: BoxConstraints(
              minHeight: 150,
            ),
            // color: Colors.red,
            child:Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('关闭'),
              ),
              const SizedBox(height: 5),
            FlutterTreePro(
              isMultiple: false,
              listData: treeListData,
              initialListData: initialTreeData,
              config: Config(
                parentId: 'parentId',
                dataType: DataType.DataList,
                label: 'value',
              ),
              onChecked: (List<Map<String, dynamic>> checkedList) {
                bool refresh=false;
                setState(() {
                  if(checkedList != null && checkedList.length >0){
                    logger.v(checkedList[0]["id"]);
                    if(checkedList[0]["id"] != cid){
                      refresh=true;
                    }
                    cid=checkedList[0]["id"];
                    if(cid == 0 ){
                      cName="全部";
                    }else{
                      cName=checkedList[0]["label"];
                    }
                  }
                });
                if(refresh) {
                  //TODO 刷新数据,暂时隐藏
                  // getelemetList();
                }
              },
            ),
            ]),
          ),
          );
        },
      );
    }else{
      int? index = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(child:
          Container(
             child: Text("加载中....."),
          ),
          );
        },
      );
    }
  }

}