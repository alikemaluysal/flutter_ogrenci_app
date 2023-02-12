import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesRepository extends ChangeNotifier{
  final List<Message> messages = [
    Message("Merhaba", "Ali", DateTime.now()),
    Message("Nasılsın?", "Ali", DateTime.now()),
    Message("İyiyim teşekkürler", "Kemal", DateTime.now()),
    Message("Sen nasılsın?", "Kemal", DateTime.now()),
    Message("Ben de iyiyim", "Ali", DateTime.now()),
  ];
}

final messagesProvider = ChangeNotifierProvider((ref) {
  return MessagesRepository();
});


class NewMessageCount extends StateNotifier<int>{
   NewMessageCount(int state): super(state);

   void reset(){
     state = 0;
   }

}

final newMessageCountProvider = StateNotifierProvider<NewMessageCount, int>((ref) {
  return NewMessageCount(4);
});

class Message{
  String text;
  String sender;
  DateTime time;

  Message(this.text, this.sender, this.time);
}