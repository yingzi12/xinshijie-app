import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/components/world_detail_component.dart';
import 'package:xinshijieapp/data/world_data_utils.dart';
import 'package:xinshijieapp/models/world_entity.dart';
import 'package:xinshijieapp/screens/ElementListScreen.dart';
import 'package:xinshijieapp/screens/element_list_screen.dart';
import 'package:xinshijieapp/utils/space.dart';

class WorldIntroScreen extends StatefulWidget {
  WorldIntroScreen({Key? key,required this.wid}) : super(key: key);
  int wid;

  @override
  State<WorldIntroScreen> createState() => _WorldIntroScreenState();
}

class _WorldIntroScreenState extends State<WorldIntroScreen> {
    WorldEntity? world;
   @override
   void initState() {
     print("---------------WorldIntroScreen- initState-----------------");
    // TODO: implement initState
    super.initState();
     init();
  }


  Future<void> init() async {
    getWorldDatetail();
  }
  void getWorldDatetail()  {
    print("-----------------WorldIntroScreen---- getWorldDatetail 发送请求 --------------------");
    WorldDataUtils.getDatetail(widget.wid, success: (res) {
      print("-----------------WorldIntroScreen---- getWorldDatetail 接受请求 --------------------");
      setState(() {
        world = WorldEntity.fromJson(res["data"]);
        print("-----------------WorldIntroScreen---- getWorldDatetail 获取数据完成 --------------------");
        print(world == null);
      });
    }, fail: (code, msg) {
      print(msg);
      print("-----------------WorldIntroScreen---- getWorldDatetail fail --------------------");
    }
    );
  }
  @override
  void didUpdateWidget(covariant WorldIntroScreen oldWidget) {
    print("-----------------WorldIntroScreen---- didUpdateWidget 1 --------------------");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("-----------------WorldIntroScreen---- didUpdateWidget 2--------------------");
  }
  
  @override
  Widget build(BuildContext context) {
    print("---------------WorldIntroScreen- build-----------------");
    print(world == null);
    if(world == null ){
      print("---------------WorldIntroScreen- build world null  -----------------");
      return Center(
        child: Text('加载中...'),
      );
    }else{
      print("---------------WorldIntroScreen- build world not  -----------------");
    }
    return Center(
      child: Column(
        children: <Widget>[
          //Flex的两个子widget按1：2来占据水平空间
          WorldDetailComponent(world: world!),
          Space(8),
          //简介
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(world?.intro ??""),
          ),
          Space(8),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child:  GestureDetector(
                        onTap: () {
                          setState(() {
                            ElementList2Screen(wid: widget.wid).launch(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ElementListScreen(),
                            //   ),
                            // );
                          });
                        },
                        child:Container(
                            decoration: new BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.red, width: 1)), // 边色与边宽度
                              // borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
                            ),
                            child: Column(
                              children: <Widget>[Text("元素"), Text(world!.countElement!.toString()?? "0")],
                            ))
                    )
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => LargeDataScreen(),
                        //   ),
                        // );
                      });
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[Text("故事"), Text(world!.countStory!.toString()?? "0")],
                        )),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        decoration: new BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.red, width: 1)), // 边色与边宽度
                          // borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
                        ),
                        child: Column(
                          children: <Widget>[Text("讨论"), Text(world!.countComment!.toString()?? "0")],
                        ))),
              ],
            ),
          ),

        ],
      ),
    );
  }
}