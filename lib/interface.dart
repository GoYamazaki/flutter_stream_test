import 'dart:math';

class Message {
  int type;
  int value;

  Message(this.type, this.value);

  static Message from(Message message) {
    return Message(message.type, message.value);
  }

  @override
  String toString() {
    return 'Message{type: $type, value: $value}';
  }
}

abstract class IMessageStream {
  Stream<Message> stream();
}

class MockMessageStream extends IMessageStream {
  @override
  Stream<Message> stream() {
    return Stream<Message>.periodic(Duration(milliseconds: 500), (int count) {
      final rnd = Random();
      return Message(rnd.nextInt(100), rnd.nextInt(100));
    }).take(50);
  }
}
