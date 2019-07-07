import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('animation'),
        ),
        body: AnimWidget(),
      ),
    );
  }
}

class AnimWidget extends StatefulWidget {
  @override
  State createState() {
    return _AnimWidgetState();
  }
}

class _AnimWidgetState extends State<AnimWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      //动画时长
      duration: Duration(microseconds: 5000),
      //提供 vsync 最简单的方式，就是直接继承 SingleTickerProviderStateMixin
      vsync: this,
    );
    //开始动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final scale = ScaleTransition(
      child: FlutterLogo(
        size: 200,
      ),
      scale: controller,
    );

    return RaisedButton(
      onPressed: () {
        controller.forward();
      },
      child: Text('点击'),
    );
  }
}
