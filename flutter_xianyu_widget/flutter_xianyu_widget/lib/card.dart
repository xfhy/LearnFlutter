import 'package:flutter/material.dart';

///
/// Card来自Material组件库，可包含一些数据，通常用ListTile来组装。Card只有一个子widget，可以是column、row、list、grid或其它组合widget。
//默认情况下，Card把自己的尺寸缩小为0像素。可以用SizedBox来指定card的尺寸。
//Flutter中的Card有圆角和阴影效果。修改elevation可改变阴影效果。

class ListView2Page extends StatefulWidget {
  @override
  State createState() => _ListView2PageState();
}

class _ListView2PageState extends State<ListView2Page> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 30; i++) {
      //Card里面只能有一个直接子元素
      list.add(new Card(
        elevation: 2,
        child: new Column(
          children: <Widget>[
            new Image.asset(
              'images/image${i % 6 + 1}.PNG',
            ),
            new ListTile(
              title: new Text(
                'title$i',
                style: _itemTextStyle,
              ),
              subtitle: new Text('A'),
            ),
          ],
        ),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('card demo'),
      ),
      body: new ListView(
        children: list,
      ),
    );
  }
}

TextStyle _itemTextStyle =
    new TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0);
