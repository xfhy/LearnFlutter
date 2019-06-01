import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Stack布局,有点像FrameLayout
///

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      home: StackWidget(),
    );
  }
}

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          color: Colors.greenAccent,
        ),
        Container(
          //这个会覆盖在上面,默认在左上角
          width: 100,
          height: 100,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      ],
    );
  }
}
