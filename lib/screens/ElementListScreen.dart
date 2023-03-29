
import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/data/category_data_utils.dart';
import 'package:xinshijieapp/data/element_data_utils.dart';
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
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  List<ElementEntity> elementList = [];
  // List<C> categoryList = [];
  int _count = 0;
  int pageNum = 1;

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
    getelemetList();
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
  void getelemetList()  {
    ElementDataUtils.getPageList({'pageNum':pageNum, 'pageSize': 6,'wid':widget.wid}, success: (res) {
      setState(() {
        List<ElementEntity> elemetList2 = List<ElementEntity>.from(
            res['rows'].map((x) => ElementEntity.fromJson(x)));
        if(elemetList2 != null){
          elementList.addAll(elemetList2);
        }
        _count=elementList.length;
      });
    }, fail: (code, msg) {
      print("-----------------_WorldCommnetScreen---- getelemetList fail --------------------");
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final themeData = Theme.of(context);
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
                      TextButton(onPressed: (){
                        // Dialog(child: TreeView(
                        //   data: treeData,
                        //   showFilter: true,
                        // ),);
                        showListDialog();
                      }, child: Text("点击选择分类")),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Text("已经选择分类:")
                      ]),

                      // Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       CircleAvatar(
                      //         backgroundImage: AssetImage(widget.elemet.circleUrl!),
                      //         radius: 20,
                      //       ),
                      //       Text(widget.elemet.nickname!, style: boldTextStyle(color:  Color(0xFFFD5530))),
                      //     ]),
                      // Text(widget.elemet.comment!, style: boldTextStyle()),
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
                  // homeTitleWidget(titleText: "评论", onAllTap: () {},),
                  Expanded(child:
                  EasyRefresh(
                    controller: _controller,
                    header: BezierCircleHeader(
                      foregroundColor: themeData.scaffoldBackgroundColor,
                      backgroundColor: themeData.colorScheme.primary,
                    ),
                    onRefresh: () async {
                      print("调用onRefresh");
                      await Future.delayed(const Duration(seconds: 2));
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        pageNum = 1;
                        _count=0;
                        elementList.clear();
                        getelemetList();
                        // _count = 10;
                      });
                      _controller.finishRefresh();
                      _controller.resetFooter();
                    },
                    onLoad: () async {
                      print("调用onLoad");
                      await Future.delayed(const Duration(seconds: 2));
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        pageNum +=1;
                        getelemetList();
                      });
                      _controller.finishLoad(
                          _count >= 20 ? IndicatorResult.noMore : IndicatorResult.success);
                    },
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.zero,
                      itemCount: _count,
                      itemBuilder: (ctx, index) {
                        print("调用ListView count:"+_count.toString()+" index:"+index.toString());
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
                          ),
                        );
                      },
                    ),
                  ),
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
  List<Map<String, dynamic>> initialTreeData = [
  ];


  // loadData() async {
  //   logger.i("loadData-----");
  //   var response = await rootBundle.loadString('assets/data.json');
  //   setState(() {
  //     treeListData = [];
  //     json.decode(response)['country'].forEach((item) {
  //       treeListData.add(item);
  //     });
  //   });
  // }

  Future<void> showListDialog() async {
    getTree();
    // loadData();
    if(treeListData.length>0) {
      int? index = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(child:
          Container(
            constraints: BoxConstraints(
              minHeight: 150,
            ),
            color: Colors.red,
            child:
            FlutterTreePro(
              // isExpanded: true,
              isMultiple: false,
              listData: treeListData,
              initialListData: initialTreeData,
              config: Config(
                parentId: 'parentId',
                dataType: DataType.DataList,
                label: 'value',
              ),
              onChecked: (List<Map<String, dynamic>> checkedList) {
                logger.v("checkedList.length");
              },
            ),
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