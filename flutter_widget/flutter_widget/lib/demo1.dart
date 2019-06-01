import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI basic 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: Column(
          children: <Widget>[
            //图片区域
            Image.asset(
              'images/xfhy.png',
              width: 600,
              height: 240,
              //cover 类似于Android中的centerCrop ,其他一些类型,看这里https://docs.flutter.io/flutter/painting/BoxFit-class.html
              //fill 有点像FitXY
              fit: BoxFit.fill,
            ),

            //标题区域
            // 为了给 title section 加上 padding，这里我们给内容套一个 Container
            Container(
              padding: EdgeInsets.all(32),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '这里是标题',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Text(
                            '这里是描述',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text('41'),
                ],
              ),
            ),

            //按钮区域
            Container(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //对齐方式：平均间隔
                  children: <Widget>[
                    Column(
                      //mainAxisSize: MainAxisSize.max,
                      //沿着mainAxis (主轴) 居中放置
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.print,
                          color: Colors.blue,
                        ),
                        Text(
                          'Call',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      //mainAxisSize: MainAxisSize.max,
                      //沿着mainAxis (主轴) 居中放置
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.print,
                          color: Colors.blue,
                        ),
                        Text(
                          'Call',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      //mainAxisSize: MainAxisSize.max,
                      //沿着mainAxis (主轴) 居中放置
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.print,
                          color: Colors.blue,
                        ),
                        Text(
                          'Call',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
