import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'test', home: FlatButtonWidget());
  }
}

class FlatButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var flatBtn = FlatButton(
      onPressed: () => print('FlatButton pressed'),
      child: Text(
        'Button',
        style: TextStyle(color: Colors.blue),
      ),
    );
    var raisedButton = RaisedButton(
      onPressed: () => print('RaisedButton pressed${DateTime.now().toString()}'),
    );

    return flatBtn;
  }
}
