import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextWidget(),
    );
  }
}

///GestureDetector可以监听手势事件
///onTapDown：按下
//onTap：点击动作
//onTapUp：抬起
//onTapCancel：前面触发了 onTapDown，但并没有完成一个 onTap 动作
//onDoubleTap：双击
//onLongPress：长按
//onScaleStart, onScaleUpdate, onScaleEnd：缩放
//onVerticalDragDown, onVerticalDragStart, onVerticalDragUpdate, onVerticalDragEnd, onVerticalDragCancel, onVerticalDragUpdate：在竖直方向上移动
//onHorizontalDragDown, onHorizontalDragStart, onHorizontalDragUpdate, onHorizontalDragEnd, onHorizontalDragCancel, onHorizontalDragUpdate：在水平方向上移动
//onPanDown, onPanStart, onPanUpdate, onPanEnd, onPanCancel：拖曳（水平、竖直方向上移动）
//
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return RaisedButton(
      child: Text('click'),
      onPressed: () => debugPrint('click '),
    );*/
    return GestureDetector(
      child: Text('text'),
      onTap: () => debugPrint("clicked"),
    );
  }
}
