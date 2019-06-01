import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///布局 Container,Padding,Center
//////最简单的布局——Container、Padding 和 Center：
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '哈哈',
      home: CenterWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('text'),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      width: 80.0,
      //装饰
      decoration: BoxDecoration(
          //背景色
          color: Colors.grey,
          //圆角
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Text('text'),
    );
  }
}

class CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(6),
      ),
      //将文本放中间
      child: Center(
        child: Text('center text'),
      ),
    );
  }
}
