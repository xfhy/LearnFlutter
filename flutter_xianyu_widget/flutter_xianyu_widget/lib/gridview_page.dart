import 'package:flutter/material.dart';

//GridView
class GridDemoPage extends StatefulWidget {
  @override
  State createState() => _GridDemoPageState();
}

class _GridDemoPageState extends State<GridDemoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Grid Page 1 demo'),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }

  Widget buildGrid() {
    //extent指定子项占据的最大宽度
    /*return new GridView.extent(
      maxCrossAxisExtent: 150,
      padding: EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(30),
    );*/

    return new GridView.count(
      crossAxisCount: 2,   //列数
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      padding: const EdgeInsets.all(4),
      childAspectRatio: 1.3,  //纵横比
      children: _buildGridTileList(30),
    );
  }

  List<Container> _buildGridTileList(int count) {
    //生成
    return new List<Container>.generate(
        count,
        (int index) => new Container(
              child: new Image.asset('images/image${(index % 6) + 1}.PNG'),
            ));
  }
}
