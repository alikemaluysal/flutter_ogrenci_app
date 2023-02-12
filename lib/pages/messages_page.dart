import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/messages_repository.dart';
import 'package:ogrenci_app/models/message.dart';

class MessagesPage extends ConsumerStatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MessagesPage> createState() => _MessagesPageState();


}

class _MessagesPageState extends ConsumerState<MessagesPage> {

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) => ref.read(newMessageCountProvider.notifier).reset());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final messagesRepository = ref.watch(messagesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlar"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messagesRepository.messages.length,
              itemBuilder: (context, index) {
                if(index > messagesRepository.messages.length){
                  return null;
                }
                return MessageView(messagesRepository.messages[messagesRepository.messages.length-index - 1]);
              },
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                        ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              decoration: InputDecoration(border: InputBorder.none),
                            ),
                          )
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageView extends StatelessWidget {
  final Message message;
  const MessageView(this.message,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.sender == "Ali" ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Colors.orange.shade100,
              border: Border.all(color: Colors.grey, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(message.text),
          ),
        ),
      ),
    );
  }
}
