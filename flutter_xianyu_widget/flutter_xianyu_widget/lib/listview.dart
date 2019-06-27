import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 30; i++) {
      list.add(new ListTile(
        //标题
        title: new Text(
          'title $i',
        ),
        //副标题
        subtitle: new Text('A'),
        //图标
        leading: i % 3 == 0
            ? new Icon(
                Icons.theaters,
                color: Colors.blue,
              )
            : new Icon(
                Icons.restaurant,
                color: Colors.blue,
              ),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView Demo'),
      ),
      body: new Container(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }
}

TextStyle _textStyle = new TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
