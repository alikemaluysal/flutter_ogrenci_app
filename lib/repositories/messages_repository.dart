class MessagesRepository{
  final List<Message> messages = [
    Message("Merhaba", "Ali", DateTime.now()),
    Message("Nasılsın?", "Ali", DateTime.now()),
    Message("İyiyim teşekkürler", "Kemal", DateTime.now()),
    Message("Sen nasılsın?", "Kemal", DateTime.now()),
    Message("Ben de iyiyim", "Ali", DateTime.now()),
  ];
}

class Message{
  String text;
  String sender;
  DateTime time;

  Message(this.text, this.sender, this.time);
}