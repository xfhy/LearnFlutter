import 'package:flutter/material.dart';
import 'package:flutter_gesture_detector/Message.dart';
import 'package:flutter_gesture_detector/message_list.dart';

void main() => runApp(MyApp());

class MessageForm extends StatefulWidget {
  @override
  State createState() {
    return _MessageFormState();
  }
}

///这个是输入消息  需要返回数据到消息列表
class _MessageFormState extends State<MessageForm> {
  final editController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      //一行
      child: Row(
        children: <Widget>[
          // 我们让输入框占满一行里除按钮外的所有空间
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              //TextField是输入框
              child: TextField(
                //装饰
                decoration: InputDecoration(
                  hintText: 'Input message',
                  contentPadding: EdgeInsets.all(0),
                ),
                style: TextStyle(fontSize: 22, color: Colors.black54),
                //通过controller才能获取数据
                controller: editController,
                //自动获取焦点,这样在页面打开时就会走动弹出输入法
                autofocus: true,
              ),
            ),
          ),

          //为了演示如何监听手势事件，我们这里故意自己用 Container 做了一个按钮，然后通过 InkWell 监听手势事件。InkWell 除了上面展示的几个事件外，还带有一个水波纹效果。如果不需要这个水波纹效果，读者也可以使用 GestureDetector。
          InkWell(
            onTap: () {
              debugPrint("send: ${editController.text}");
              //创建消息  用于返回   DateTime用于获取时间
              final msg = Message(
                  editController.text, DateTime.now().millisecondsSinceEpoch);
              //返回   msg对象可以直接放到pop里面进行返回
              Navigator.pop(context, msg);
            },
            onDoubleTap: () => debugPrint("double 点击"),
            onLongPress: () => debugPrint("长按"),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              child: Text("Send"),
              //边框
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UX demo',
      home: MessageListScreen(),
    );
  }
}

class AddMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add message'),
      ),
      body: MessageForm(),
    );
  }
}

class MessageListScreen extends StatelessWidget {
  //GlobalKey 的是应用全局唯一的 key，把这个 key 设置给 MessageList 后，我们就能够通过这个 key 拿到对应的 statefulWidget 的 state。
  final messageListKey =
      GlobalKey<MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Echo client'),
      ),

      body: MessageList(
        key: messageListKey,
      ),

      //按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //压栈  跳转  //等待消息返回
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddMessageScreen()),
          );
          debugPrint(result.toString());
          if (result is Message) {
            messageListKey.currentState.addMessage(result);
          }
        },
        //文字
        tooltip: 'Add message',
        //图标
        child: Icon(Icons.add),
      ),
    );
  }
}
