import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  getData();
}

void getData() {
  bool a = false;
  final bool b = false; //运行时常量
  const bool c = false; //编译时常量
  var d = false;
  final e = false;
  const f = false;

  var str = "";
  //Dart 比较字符串相等用==
  if (str == "") {}

  var list = List<int>();
  list.add(1);
  list.add(2);

  var set = Set<String>();
  set.add("a");
  set.add("b");
  if (set.contains("a")) {}

  var map = Map<String, String>();
  //添加
  map['aa'] = 'aa';
  map['bb'] = 'bb';
  //修改
  map['aa'] = 'cc';

  //Dart所有东西都是对象
  Object o = 'a';
  o = 4;
  if (o is Map<String, int>) {
    o['a'] = 3; //不用在转换了,编译器自动识别
  }

  try {} on FormatException catch (e) {} on Exception {} finally {}
}

///这里的y参数表示可选  y还可以定义默认值
int foo(int x, [int y = 3]) {
  if (y != null) {} //int也可能是null的
}

//居然不支持函数重载
void foo1() {
  var file = File('path.txt');
  file
      .exists()
      .then((exists) => {debugPrint('')})
      .catchError((e) => debugPrint(e));
}

void foo2() async{
  var file = File('path.txt');

  var exists = await file.exists();
  print('bar: file ${exists ? 'exists' : 'not exists'}');
}


class point2d {
  int x;
  int y;

  //如果我们不想某个变量对包的外部可见，可以使用下划线开头来给变量命名。
  int _z;

  point2d(this.x, this.y);

  @override
  String toString() {
    return 'point2d{x: $x, y: $y}';
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
