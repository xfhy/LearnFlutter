import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gesture_detector/Message.dart';

class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  @override
  State createState() {
    return MessageListState();
  }
}

class MessageListState extends State<MessageList> {
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final subtitle = DateTime.fromMicrosecondsSinceEpoch(msg.timestamp)
            .toLocal()
            .toIso8601String();
        return ListTile(
          title: Text(msg.msg),
          subtitle: Text(subtitle),
        );
      },
    );
  }

  void addMessage(Message msg) {
    setState(() {
      messages.add(msg);
    });
  }
}
