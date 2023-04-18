
import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/data/category_data_utils.dart';
import 'package:xinshijieapp/models/story_entity.dart';
import 'package:xinshijieapp/screens/story/story_datail_screen.dart';
import 'package:xinshijieapp/utils/AppColors.dart';


class StoryListcreen extends StatefulWidget {
  StoryListcreen({Key? key,required this.wid}) : super(key: key);
  int wid;

  @override
  State<StoryListcreen> createState() => _StoryListcreenState();
}

class _StoryListcreenState extends State<StoryListcreen> {
  var logger = Logger(
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  );
  String fiflter="""
  {
        "list": [
            {
                "title": "单列",
                "key": "one_list_key",
                "type": "radio",
                "defaultValue": "",
                "value": "",
                "children": [
                    {
                        "title": "不限",
                        "key": "",
                        "type": "unlimit",
                        "defaultValue": "",
                        "value": ""
                    },
                    {
                        "title": "选项一",
                        "key": "",
                        "type": "radio",
                        "defaultValue": "",
                        "value": "1"
                    },
                    {
                        "title": "选项二",
                        "key": "",
                        "type": "radio",
                        "defaultValue": "",
                        "value": "2"
                    },
                    {
                        "title": "选项三",
                        "key": "",
                        "type": "radio",
                        "defaultValue": "",
                        "value": "3"
                    }
                ]
            },
            {
                "title": "第二",
                "key": "two_list_key",
                "type": "radio",
                "defaultValue": "",
                "value": "",
                "children": [
                    {
                        "title": "不限",
                        "key": "",
                        "type": "unlimit",
                        "defaultValue": "",
                        "value": ""
                    },
                    {
                        "title": "选项一",
                        "key": "",
                        "type": "radio",
                        "defaultValue": "",
                        "value": "1"
                    },
                    {
                        "title": "选项二",
                        "key": "",
                        "type": "radio",
                        "defaultValue": "",
                        "value": "2"
                    }
                ]
            },
            {
                "title": "第三",
                "key": "three_list_key",
                "type": "radio",
                "defaultValue": "",
                "value": "",
                "children": [
                    {
                        "title": "不限",
                        "key": "",
                        "type": "unlimit",
                        "defaultValue": "",
                        "value": ""
                    },
                    {
                        "title": "选项一",
                        "key": "",
                        "type": "radio",
                        "defaultValue": "",
                        "value": "1"
                    },
                    {
                        "title": "选项二",
                        "key": "",
                        "type": "radio",
                        "defaultValue": "",
                        "value": "2"
                    },
                    {
                        "title": "选项三",
                        "key": "",
                        "type": "radio",
                        "defaultValue": "",
                        "value": "3"
                    }
                ]
            }
        ]
}
  """;
  int _count = 0;
  int pageNum = 1;

  late EasyRefreshController _controller;
  List<StoryEntity> storyList=[];

  late List<BrnSelectionEntity> listBrn;
  late BrnSelectionEntity typeSlection;
  List<BrnSelectionEntity>? typeSelec= <BrnSelectionEntity>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 显式类型转换, List<dynamic>   ->  List<Map<String, dynamic>>
    print("-------------listbean--------");
    init();
    listBrn = <BrnSelectionEntity>[];
    getFilter();
    getTree();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(covariant StoryListcreen oldWidget) {
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
  Future<void> init() async {
    getStoryList();
  }
  void getStoryList()  {
    // CommentsDataUtils.getPageList({'pageNum':pageNum, 'pageSize': 6,'wid':widget.wid}, success: (res) {
    setState(() {
      for(int i=_count;i<_count+10;i++) {
        var storyEntity= StoryEntity();
        storyEntity.id = _count+1;
        storyEntity.typeName = "科幻";
        storyEntity.imgUrl = "";
        storyEntity.name = "这是测试"+i.toString();
        storyEntity.author = "作者";
        storyEntity.intro = "故事简介,故事简介,故事简介,故事简介,故事简介,故事简介,故事简介,故事简介,故事简介,";
        storyList.add(storyEntity);
      }
      _count=storyList.length;
    });
    // }, fail: (code, msg) {
    //   print("-----------------_WorldCommnetScreen---- getCommentsList fail --------------------");
    // });
  }

  void getFilter(){
    Map userMap =json.decode(fiflter);
    var listDynamic =userMap['list'];
    /// 显式类型转换, List<dynamic>   ->  List<Map<String, dynamic>>
    List<Map<String, dynamic>> listMap = new List<Map<String, dynamic>>.from(listDynamic);
    print("-------------listbean--------");
    listBrn = <BrnSelectionEntity>[];
    for (int i = 0; i < listMap.length; i++) {
      BrnSelectionEntity dd= BrnSelectionEntity.fromMap(listMap[i]);
      listBrn.add(dd);
    }
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
                title: Text('故事列表',style:TextStyle(color: appTextColorPrimary)),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  // height: 100,
                  child: BrnSelectTag(
                      tags: tagList,
                      tagWidth: 40,
                      softWrap: false,
                      initTagState:[true],
                      onSelect: (index) {
                        BrnToast.show("$index is selected", context);
                      })
                ),
              ),
            ];
          },
          body: SafeArea(
            child:
            Stack(
              fit: StackFit.expand,
              children: [
                Column(
                    children: <Widget>[
                      BrnSelectionView(
                          originalSelectionData: listBrn,
                          onSelectionChanged: (int menuIndex,
                              Map<String, String> filterParams,
                              Map<String, String> customParams,
                              BrnSetCustomSelectionMenuTitle setCustomTitleFunction) {
                            BrnToast.show(filterParams.toString(), context);
                          }
                      ),
                      // homeTitleWidget(titleText: "评论", onAllTap: () {},),
                      Expanded(
                        child: EasyRefresh(
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
                            storyList.clear();
                            getStoryList();
                            // _count = 10;
                          });
                          _controller.finishRefresh();
                          _controller.resetFooter();
                        },
                        onLoad: () async {
                          print("调用onLoad");
                          print(storyList.length);
                          await Future.delayed(const Duration(seconds: 2));
                          if (!mounted) {
                            return;
                          }
                          setState(() {
                            pageNum +=1;
                            getStoryList();
                          });
                          _controller.finishLoad(
                              _count >= 50 ? IndicatorResult.noMore : IndicatorResult.success);
                        },
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          padding: EdgeInsets.zero,
                          itemCount: _count,
                          itemBuilder: (ctx, index) {
                            // print("调用ListView count:"+_count.toString()+" index:"+index.toString()+" 故事:"+storyList![index].toString() );
                            return   StoryIntroduceWigth(storyList![index] );
                          },
                        ),
                      ),
                      ),

                    ]),
              ],
            ),)
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

  Widget StoryIntroduceWigth(StoryEntity story){
    return   Card(
      child: ListTile(
        leading: FlutterLogo(size: 72.0),
        title: Text(
          story.name!,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
            maxLines: 2,
            softWrap: false,
            overflow: TextOverflow.ellipsis, story.intro!),
        onTap: (){
          StoryDatailScreen(wid: widget.wid,sid: 20).launch(context);
        },
      ),
    );
  }
}
