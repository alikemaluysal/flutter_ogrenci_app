import 'dart:math';

import 'package:flutter/material.dart';

import '../repositories/messages_repository.dart';

class MessagesPage extends StatefulWidget {
  final MessagesRepository messagesRepository;
  const MessagesPage(this.messagesRepository,{Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlar"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: widget.messagesRepository.messages.length,
              itemBuilder: (context, index) {
                if(index > widget.messagesRepository.messages.length){
                  return null;
                }
                return MessageView(widget.messagesRepository.messages[widget.messagesRepository.messages.length-index - 1]);
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
