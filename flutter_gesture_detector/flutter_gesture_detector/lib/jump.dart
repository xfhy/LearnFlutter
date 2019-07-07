import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter navigation',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  State createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation deme'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('first screen'),
          onPressed: () async {
            //压栈
            var msg = await Navigator.push(
                context, MaterialPageRoute(builder: (_) => SecondScreen()));
            debugPrint('msg = $msg');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation deme2'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Second screen'),
          onPressed: () {
            //弹栈
            Navigator.pop(context, 'message from second screen');
          },
        ),
      ),
    );
  }
}
