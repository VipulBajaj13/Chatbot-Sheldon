import 'package:flutter/material.dart';
import 'package:chatbot/pages/front.dart';
import 'package:chatbot/pages/chat.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Front(),
        '/chat': (context) => Chat(),
      }));
}
