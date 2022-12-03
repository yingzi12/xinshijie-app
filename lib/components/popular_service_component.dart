import 'package:flutter/material.dart';
import 'package:xinshijieapp/models/world_model.dart';
import 'package:xinshijieapp/utils/AppImages.dart';
import 'package:xinshijieapp/utils/Git.dart';

class PopularServiceComponent extends StatefulWidget {
  @override
  _PopularServiceComponentState createState() => _PopularServiceComponentState();
}

class _PopularServiceComponentState extends State<PopularServiceComponent> {
  late List<World> servicesList;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //获取世界推荐
    servicesList=getWorldRecommendedList();
    //
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
          servicesList.length,
          (index) => GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
              // );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(servicesList[index], fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<World>> getWorldRecommendedList() async {
    var data = await Git(context).getRepos(
      queryParameters: {
        'pageSize': 6,
      },
    );
   return data;

  }
}
