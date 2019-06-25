import 'package:flutter/material.dart';
import 'package:flutter_xianyu_widget/stack.dart';

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
      home: StackWidget(),
    );
  }
}

//文本
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "hello flutter", //文本数据
      textAlign: TextAlign.center, //居中显示
      maxLines: 1, //只有一行
      overflow: TextOverflow.ellipsis, //省略号
      style: TextStyle(fontSize: 30.0, color: Colors.yellow),
      //TextStyle是拿来控制它的style的
    );
  }
}

//图片
class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://gw.alicdn.com/tfs/TB1CgtkJeuSBuNjy1XcXXcYjFXa-906-520.png',
      fit: BoxFit.contain,
      //包含  具体详情看 https://juejin.im/post/5b8ce76f51882542c0626887
      width: 200,
      height: 200,
    );
  }
}

//装饰  圆角
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //居中
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(15.0),
      //装饰
      decoration: new BoxDecoration(
        //边框
        border: new Border.all(
          color: Colors.red,
        ),
        //背景
        image: const DecorationImage(
          image: const NetworkImage(
              "https://gw.alicdn.com/tfs/TB1CgtkJeuSBuNjy1XcXXcYjFXa-906-520.png"),
          fit: BoxFit.contain,
        ),
        //圆角
        borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(3.0),
            topRight: Radius.circular(6.0),
            bottomLeft: Radius.circular(9.0),
            bottomRight: Radius.circular(0.0)),
      ),
    );
  }
}

//flex布局   感觉有点像LinearLayout
///flex布局中对子布局的控制是从main axis 和cross axis两个方向上进行的。   main axis是横着的,cross axis是竖着的
class FlexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center, //横轴
      crossAxisAlignment: CrossAxisAlignment.center, //竖轴
      children: <Widget>[
        new Container(
          width: 40.0,
          height: 60.0,
          color: Colors.lightBlue,
          child: const Center(
            child: const Text(
              "left",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
        new Container(
          width: 80.0,
          height: 60.0,
          color: Colors.amber,
          child: const Center(
            child: const Text(
              "middle",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
        new Container(
          width: 60.0,
          height: 60.0,
          color: Colors.amberAccent,
          child: const Center(
            child: const Text(
              "right",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}

//flex布局按比例设置
class FlexWeightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: new Container(
            color: Colors.blue,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "left",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        new Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: new Container(
            color: Colors.amberAccent,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "right",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
