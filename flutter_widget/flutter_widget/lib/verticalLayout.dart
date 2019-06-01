import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///水平,竖直,Expand

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '大叔大婶',
      home: ExpandWidget(),
    );
  }
}

class HorizontalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // 只有一个子元素的 widget，一般使用 child 参数来设置；Row 可以包含多个子控件，
      // 对应的则是 children。
      children: <Widget>[
        Container(
          //来点margin
          child: Text('1'),
          margin: EdgeInsets.all(10),
        ),
        Text('2'),
        Text('3'),
        Text('4'),
        Text('5'),
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //来点margin
          child: Text('1'),
          margin: EdgeInsets.all(10),
        ),
        Text('2'),
        Text('3'),
        Text('4'),
        Text('5'),
      ],
    );
  }
}

///ExpandWidget 占满一行里除
class ExpandWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('2'),
        Text('3'),
        Text('4'),
        //这个按钮占满一行剩余空间
        Expanded(
          flex: 2,  //占剩余空间2/3
          child: RaisedButton(
            child: Text('1'),
            onPressed: () => print('dasdsa'),
          ),
        ),

        Expanded(
          flex: 1,
          child: RaisedButton(
            child: Text('2'),
            onPressed: () => print('dasdsa'),
          ),
        ),
      ],
    );
  }
}
