// this class sends messages to "www.example.com:8000"
// and receives messages from "www.example.com:8000"
// using WebSocket protocol.

import 'package:flutter/material.dart';

class MessageSender extends StatelessWidget {
  final String message;
  final String url = 'www.example.com';
  final int port = 8000;

  MessageSender({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
