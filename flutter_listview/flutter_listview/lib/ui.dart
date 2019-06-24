import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_listview/building.dart';

///定义一个回调接口
typedef OnItemClickListener = void Function(int position);

///一行的布局
class ItemView extends StatelessWidget {
  final int position;
  final Building building;
  final OnItemClickListener listener;

  ItemView(this.position, this.building, this.listener);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      building.type == BuildingType.restaurant
          ? Icons.restaurant
          : Icons.theaters,
      color: Colors.blue[500],
    );

    final widget = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: icon,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                building.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );

    // 一般来说，为了监听手势事件，我们使用 GestureDetector。但这里为了在点击的时候有个
    // 水波纹效果，使用的是 InkWell。
    return InkWell(
      onTap: () => listener(position),
      child: widget,
    );
  }
}

//这是ListView
class BuildingListView extends StatelessWidget {
  final List<Building> buildings;
  final OnItemClickListener listener;

  BuildingListView(this.buildings, this.listener);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: buildings.length,
      itemBuilder: (context, index) {
        return new ItemView(index, buildings[index], listener);
      },
    );
  }
}
