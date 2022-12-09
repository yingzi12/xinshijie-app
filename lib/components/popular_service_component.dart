import 'package:flutter/material.dart';
import 'package:xinshijieapp/data/world_data_utils.dart';
import 'package:xinshijieapp/models/world_entity.dart';
import 'package:xinshijieapp/screens/world_detail_screen.dart';
import 'package:xinshijieapp/utils/AppConstant.dart';

class PopularServiceComponent extends StatefulWidget {
  @override
  _PopularServiceComponentState createState() => _PopularServiceComponentState();
}

class _PopularServiceComponentState extends State<PopularServiceComponent> {
  late List<WorldEntity> worldRecommendedList;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //获取世界推荐
   getWorldRecommendedList();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          worldRecommendedList.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorldDetailScreen(wid: worldRecommendedList[index].id ?? -1)),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(aliyunImgUrl+(worldRecommendedList[index].imgUrl ?? ""), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getWorldRecommendedList()  {
    WorldDataUtils.getPageList({'pageNum': 1, 'pageSize': 6}, success: (res) {
      worldRecommendedList = List<WorldEntity>.from(res['rows'].map((x) => WorldEntity.fromJson(x)));
    }, fail: (code, msg) {});
  }

}
