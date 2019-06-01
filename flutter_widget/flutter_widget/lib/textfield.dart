import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///文本输入框
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField',
      home: MessageForm(),
    );
  }
}

class MessageForm extends StatefulWidget {
  @override
  State createState() {
    return _MessageFormState();
  }
}

class _MessageFormState extends State<MessageForm> {
  var editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Material(
            //文本输入框
            child: TextField(
              controller: editController,
            ),
          ),
        ),
        RaisedButton(
          child: Text('click'),
          onPressed: () {

            //弹出对话框
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Text(editController.text),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('OK'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  );
                });
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //居然需要手动调用controller的dispose方法 来释放资源
    editController.dispose();
  }
}
