//消息数据建模
class Message {
  final String msg;
  final int timestamp;

  Message(this.msg, this.timestamp);

  @override
  String toString() {
    return 'Message{msg: $msg, timestamp: $timestamp}';
  }
}
