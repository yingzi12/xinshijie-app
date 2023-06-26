import 'package:xinshijieapp/utils/bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:xinshijieapp/models/world_entity.dart';
import 'package:xinshijieapp/utils/AppConstant.dart';
import 'package:badges/badges.dart' as badges;

class WorldDetailComponent extends StatefulWidget {

  WorldDetailComponent({Key? key,required this.world}) : super(key: key);
  WorldEntity world;
  @override
  State<WorldDetailComponent> createState() => _WorldDetailComponentState();
}

class _WorldDetailComponentState extends State<WorldDetailComponent> {
  @override
  Widget build(BuildContext context) {
    print("---------------_WorldDetailComponentState- build-----------------");
    var imageWidget;
    if(widget.world.imgUrl == null){
      imageWidget = const AssetImage("images/empty.jpg");
    }else{
      imageWidget = NetworkImage(aliyunImgUrl+(widget.world.imgUrl ?? ""));
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image(
                width: 100.0,
                height: 140.0,
                fit:BoxFit.fill,
                image:  imageWidget,
              ),
            ),
            Expanded(
              flex: 4,
              child: buildDesc(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildDesc(BuildContext context) {
    print("---------------_VideoDescription- build-----------------");
    List<String> sourceList=widget.world.xSource!.split(";");
    List<Widget> tagList=_listView(sourceList);
    tagList.add( BrnStateTag(
      tagText: widget.world.typeName??"",
      tagState: TagState.succeed,
    ));
    int rank= widget.world.ranks?? 0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      badges.Badge(
        badgeContent: Text(rank.toString()),
            child: Text(
              widget.world.name ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            widget.world.createName ?? "",
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            children: tagList,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.apps,
                  color: Colors.green, size: 20),
              Text(
                "元素:"+widget.world.countElement.toString(),
                textScaleFactor: 0.8,
              ),
              Icon(Icons.book,
                  color: Colors.green, size: 20),
              Text(
                "故事:"+widget.world.countStory.toString(),
                textScaleFactor: 0.8,
              ),
              Icon(Icons.comment,
                  color: Colors.green, size: 20),
              Text(
                "讨论:"+widget.world.countComment.toString(),
                textScaleFactor: 0.8,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                child: Text("评论"),
                onPressed: () {
                  // ElementDetailComponent().launch(context);
                },
              ),
              SizedBox(width: 10),
              ElevatedButton(
                child: Text("收藏"),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }


  List<Widget> _listView(List<String> sourList){
    return sourList.map((f)=>
        BrnStateTag(
          tagText: f,
          tagState: TagState.succeed,
        )
    ).toList();
  }
}
