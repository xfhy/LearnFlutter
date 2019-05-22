import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      home: ImageWidget(),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用网络图片
    return Image.network(
      'https://mp.weixin.qq.com/mp/qrcode?scene=10000004&size=102&__biz'
          '=MzAxMTI4MTkwNQ==&mid=2650828001&idx=1&sn=6d1256ebf83df80e00431d9ad47c1cea&send_time=',
      width: 200,
      height: 200,
    );
  }
}
