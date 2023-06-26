import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/test/diolog/dio_log_main.dart';
import 'package:xinshijieapp/test/extended_nested_scroll_view_exam/ENSCVMain.dart';
import 'package:xinshijieapp/test/fluttertoast/FlutterToastMain.dart';
import 'package:xinshijieapp/test/head2_list_vice.dart';
import 'package:xinshijieapp/test/head_list_comment_vice.dart';
import 'package:xinshijieapp/test/head_list_vice.dart';
import 'package:xinshijieapp/test/html_test.dart';
import 'package:xinshijieapp/test/nested_scroll_view.dart';
// import 'package:xinshijieapp/test/quil/quill_test.dart';
import 'package:xinshijieapp/test/tree/TreeMain.dart';
import 'package:xinshijieapp/test/tree/tree_view.dart';

class TestMainStreen extends StatefulWidget {
  const TestMainStreen({Key? key}) : super(key: key);

  @override
  State<TestMainStreen> createState() => _TestMainStreenState();
}

class _TestMainStreenState extends State<TestMainStreen> {
  @override
  Widget build(BuildContext context) {
    print("_TestMainStreenState:");
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试列表",style:TextStyle(color: Colors.black)),
        backgroundColor:Colors.green,
      ),
      body: ListView.builder(
          itemCount: serviceProviders.length,
          itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(serviceProviders[index].serviceName),
                subtitle:Text(serviceProviders[index].intro),
                onTap: () {
                 serviceProviders[index].widget.launch(context);;
                },
            );
          }
      ),
    );
  }
}


List<TheamTestModel> serviceProviders = getServices();

class TheamTestModel {
  int id;
  String serviceName;
  String intro;
  Widget widget;

  TheamTestModel(this.id, this.serviceName,  this.intro,  this.widget);
}

List<TheamTestModel> getServices() {
  List<TheamTestModel> list = List.empty(growable: true);
  list.add(TheamTestModel(1, "下拉刷新", "下拉刷新",const NestedScrollViewPage()));
  // list.add(TheamTestModel(2, "带头的", "",const HeadListViewPage()));
  list.add(TheamTestModel(3, "带评论的", "带评论输入框的",const HeadListCommentViewPage()));
  list.add(TheamTestModel(4, "ENSCVMain demo", "将外部滚动(Header部分)和内部滚动(Body部分)联动起来。里面滚动不了，滚动外面。外面滚动没了，滚动里面", ENSCVMain()));
  // list.add(TheamTestModel(5, "带头的", "Who helps you in cleaning the house",const Head2ListViewPage()));
  // list.add(TheamTestModel(6, "quill", "富文本编辑器", QuillMainStreen()));
  list.add(TheamTestModel(7, "html test", "显示html内容", const HtmlTestStreen()));
  list.add(TheamTestModel(8, " Flutter Toast", "信息提示框", FlutterToastMain()));
  list.add(TheamTestModel(9, " Flutter Toast", "弹出框", DiologMain()));
  list.add(TheamTestModel(10, "树图操作", "树", const TreeMain()));
  list.add(TheamTestModel(11, "树图展示", "树", const TreeViewMain()));

  return list;
}

