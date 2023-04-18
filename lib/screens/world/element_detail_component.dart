import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/data/element_data_utils.dart';
import 'package:xinshijieapp/http/apis.dart';
import 'package:xinshijieapp/models/element_entity.dart';
import 'package:xinshijieapp/utils/flutter_html/flutter_html.dart';
class ElementDetailComponent extends StatefulWidget {
  ElementDetailComponent({Key? key, required this.wid, required this.eid}) : super(key: key);
  int wid;
  int eid;

  @override
  State<ElementDetailComponent> createState() => _ElementDetailComponentState();
}



final staticAnchorKey = GlobalKey();

class _ElementDetailComponentState extends State<ElementDetailComponent> {
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  ElementEntity? entity;
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> init() async {
    getInfo();
    setState(() {
    });
  }
  void getInfo(){
    ElementDataUtils.getInfo({"wid":widget.wid,"eid":widget.eid}, success: (res) {
      print("查询成功");
      setState(() {
        logger.i(res["data"]);
        entity=ElementEntity.fromJson(res["data"]);
      });
    }, fail: (code, msg) {
      print("-----------------_WorldCommnetScreen---- getelemetList fail --------------------");
    });
  }

  @override
  Widget build(BuildContext context) {
    if(entity == null ){
     return Container(
        child: Text("加载中....."),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(entity!.title ?? "元素详细"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.arrow_downward),
      //   onPressed: () {
      //   },
      // ),
      body: SingleChildScrollView(
        child:getCard(entity!)
      ),
    );
  }

  Widget getCard(ElementEntity entity){

    List<Widget> tagList=_listView(entity.cnameList ?? []);
    logger.i("tagList");
    logger.i(entity.cnameList );
    logger.i(tagList);
    return Card(
        child: Column(
          children: <Widget>[
            if(entity.imageUrls != null)
              Image(
                image: NetworkImage(
                    APIs.imageUrlPrefix+entity.imageUrls!),
              ),
            BrnCommonCardTitle(
              title: '基本信息',
              // accessoryWidget: BrnStateTag(tagText: '状态标签'),
              onTap: () {
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Text("分类:"),
                Expanded(child:  Wrap(
                  spacing: 8.0, // 主轴(水平)方向间距
                  runSpacing: 4.0, // 纵轴（垂直）方向间距
                  children: tagList,
                ))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("创建时间:"),
                Text(entity.createTime??""),
              ],
            ),
            BrnCommonCardTitle(
              title: '简介',
              // accessoryWidget: BrnStateTag(tagText: '状态标签'),
              onTap: () {
              },
            ),
            BrnExpandableText(
                text: entity.intro??"",
                maxLines: 2,
                onExpanded:(bool isExpanded) {
                  if (isExpanded) {
                    debugPrint('已经展开');
                  }
                  else {
                    debugPrint('已经收起');
                  }
                }
            ),
            BrnCommonCardTitle(
              title: '内容',
              // accessoryWidget: BrnStateTag(tagText: '状态标签'),
              onTap: () {
              },
            ),
            getHtml(entity!.pageHtml?? "")
          ],
        )
    ).paddingAll(8);
  }

  Widget getHtml(String content){
    logger.i(content);
    return    Html(
      anchorKey: staticAnchorKey,
      data:  content ,
      style: {
        "table": Style(
          backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          padding: const EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          padding: const EdgeInsets.all(6),
          alignment: Alignment.topLeft,
        ),
        'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
      },
      tagsList: Html.tags..addAll(['tex', 'bird', 'flutter']),
      onLinkTap: (url, _, __, ___) {
        debugPrint("Opening $url...");
      },
      onImageTap: (src, _, __, ___) {
        debugPrint(src);
      },
      onImageError: (exception, stackTrace) {
        debugPrint(exception.toString());
      },
      onCssParseError: (css, messages) {
        debugPrint("css that errored: $css");
        debugPrint("error messages:");
        for (var element in messages) {
          debugPrint(element.toString());
        }
        return '';
      },
    );
  }

  List<Widget> _listView(List<String> cnameList){
    return cnameList.map((f)=>
        BrnStateTag(
          tagText: f ?? "",
          tagState: TagState.succeed,
        )
    ).toList();
  }

}