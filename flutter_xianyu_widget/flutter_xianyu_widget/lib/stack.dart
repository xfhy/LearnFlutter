import 'package:flutter/material.dart';

///实际使用中Stack中的子Widgets分为两种：
//
//positioned
//
//是包裹在组件Positioned中的组件
//可以通过Positioned属性灵活定位
//
//
//non-positioned
//
//没有包裹在Positioned组件中
//需要通过父Widget Stack 的属性来控制布局
//
//
//
//对于non-positioned children， 我们通过控制Stack的alignment属性来控制对齐方式。Positioned的布局方式类似于H5&weex中的position布局中的absolute布局方式。
// 通过设置距离父组件上下左右的距离，Positioned对象能在Stack布局中更加灵活的控制view的展现方式。
//和FrameLayout差不多,就是堆叠,默认在左上角
class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.yellow,
      height: 150,
      width: 500,
      child: new Stack(
        children: <Widget>[
          //这个Container是没有用Positioned的,所以会默认被放在左上角
          new Container(
            color: Colors.blueAccent,
            height: 50,
            width: 100,
            alignment: Alignment.center,
            //这个只是控制Container里面的东西 放哪里
            child: Text(
              'unPositioned',
              style: TextStyle(fontSize: 12),
            ),
          ),

          //拿来定位的
          new Positioned(
            //相当于是说离左边和离上边的距离,不太灵活.  但是也还勉强
            left: 40,
            top: 80,
            child: new Container(
              color: Colors.pink,
              height: 50.0,
              width: 95.0,
              alignment: Alignment.center,
              child: Text(
                'Positioned',
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
