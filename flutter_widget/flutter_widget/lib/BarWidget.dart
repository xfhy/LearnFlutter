import 'package:flutter/cupertino.dart';
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
      home: BarWidget(),
    );
  }
}

class BarWidget extends StatefulWidget {
  @override
  State createState() {
    return _BarWidgetState();
  }
}

class _BarWidgetState extends State<BarWidget> {
  var i = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      //一行
      children: <Widget>[
        Text('i = $i'), //文本
        RaisedButton(
          //button
          onPressed: () {
            setState(() {
              ++i;
            });
          },
          child: Text('click'),
        ),
        Text('i=$i'),
        Text('i=$i')
      ],
    );
  }
}
