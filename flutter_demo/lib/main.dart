import 'package:flutter/material.dart';

void main() {
  //创建一个myApp
  runApp(MyApp());
}

/*
* 这个widget作用这个应用的顶层widget
* 这个widget是无状态的,所以我们继承的是[StatelessWidget]
* 对应的,有状态的widget可以继承[StatefulWidget]
* */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //创建内容

    //我们想使用material风格的应用,所以这里用MaterialApp
    return MaterialApp(
      //这个是应用名称, 但是我试了,不行,改了之后还是展示的flutter_demo
      title: 'FlutterDemo2222',

      //应用主页
      home: Scaffold(
        appBar: AppBar(
          //当前界面的title
          title: Text('Flutter rolling demo'),
        ),
        //Flutter里面所有的东西都是widget,为了把按钮放中间,需要一个Center(是一个widget)
        body: Center(
          child: RaisedButton(
            //点击的时候
            onPressed: _onPressed,
            child: Text('roll'),
          ),
        ),
      ),
    );
  }
}

var a = 0;

void _onPressed() {
  a++;
  print('卧槽$a');
  debugPrint('_onPressed()');
}
