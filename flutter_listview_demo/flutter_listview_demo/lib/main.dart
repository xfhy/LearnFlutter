import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("listview"),
        ),
        body: ListViewStatic(),
      ),
    );
  }
}

class ListViewStatic extends StatelessWidget {
  //生成一个数据
  final items = List<String>.generate(10000, (i) => "$i ");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(title: Text("${items[index]}"));
      },
      //item个数
      itemCount: items.length,
      //高度 可以不设置
      itemExtent: 50,
    );
  }
}
