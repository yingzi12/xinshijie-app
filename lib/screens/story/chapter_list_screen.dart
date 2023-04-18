import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xinshijieapp/models/AppModel.dart';
import 'package:xinshijieapp/utils/AppWidget.dart';
import 'package:xinshijieapp/utils/azlistview/azlistview.dart';
import 'package:xinshijieapp/utils/utils.dart';

class ChapterListScreen extends StatefulWidget {
  const ChapterListScreen({Key? key}) : super(key: key);

  @override
  State<ChapterListScreen> createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  List<ChapterModel> chapterList = [];
  ///Default Index data.
   List<String> kIndexBarData = const [
    '目标长 A',
    '目标长 B',
    '目标长 C',
    '目标长 D',
    '目标长 E',
    'tag F',
    'tag G',
    'tag H',
    'tag I',
    'tag J',
    'tag K',
    'tag L',
    'tag M',
    'tag N',
    'tag O',
    'tag P',
    'tag Q',
    'tag R',
  ];
  int numberOfItems = 100;
  double susItemHeight = 40;

  @override
  void initState() {
    super.initState();
    int i = 0;
    chapterList = List.generate(numberOfItems, (index) {
      if (index > (i + 1) * 20) {
        i = i + 1;
      }
      String tag = kIndexBarData[i];
      ChapterModel model = ChapterModel(name: '$tag $index 这是章节名称', tagIndex:  tag);
      return model;
    });

    SuspensionUtil.setShowSuspensionStatus(chapterList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10000 data'),
      ),
      body: AzListView(
        data: chapterList,
        indexBarData: kIndexBarData,
        itemCount: chapterList.length,
        itemBuilder: (BuildContext context, int index) {
          ChapterModel model = chapterList[index];
          return getListItem(context, model);
        },
        physics: BouncingScrollPhysics(),
        susItemHeight: susItemHeight,
        susItemBuilder: (BuildContext context, int index) {
          ChapterModel model = chapterList[index];
          return Utils.getSusItem(context, model.getSuspensionTag());
        },
      ),
    );
  }
}
