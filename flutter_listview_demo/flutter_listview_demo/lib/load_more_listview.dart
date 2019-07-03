import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

/*class ListViewLoadMore extends StatelessWidget {
  //生成数据
  final items = List<int>.generate(20, (i) => i);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("number ${items[index]}"),
        );
      },
    );
  }
}*/

///模拟网络请求
Future<List<int>> fakeRequest(int from, int to) async {
  //如果对Future不熟悉,可以参考: https://juejin.im/post/5b2c67a351882574a756f2eb
  return Future.delayed(Duration(seconds: 2), () {
    return List.generate(to - from, (i) => i + from);
  });
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> items = List.generate(20, (i) => i);
  ScrollController _scrollController = ScrollController();

  //是否有请求正在进行
  bool isPerformingRequest = false;

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    //添加监听器   需要加载更多的时候就加载更多的数据
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite ListView"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == items.length - 1) {
            return _buildProgressIndicator();
          } else {
            return ListTile(
              title: Text("number $index"),
            );
          }
        },
        itemCount: items.length,
        controller: _scrollController,
      ),
    );
  }

  ///获取数据
  void _getMoreData() async {
    if (!isPerformingRequest) {
      //设置为正在请求
      setState(() {
        isPerformingRequest = true;
      });

      //获取新的数据
      List<int> newEntries = await fakeRequest(items.length, items.length + 20);

      //设置为未在请求
      setState(() {
        items.addAll(newEntries);
        //下一个请求可以开始了
        isPerformingRequest = false;
      });
    }
  }
}
