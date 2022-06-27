import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Bot {
  late String botReply;

  Future<void> getChatbotReply(String userReply) async {
    Response response = await get(Uri.parse(
        "http://api.brainshop.ai/get?bid=167106&key=iABJFJf8sP50MTTg&uid=Vipul%20Bajaj&msg=$userReply"));
    Map data = jsonDecode(response.body);
    botReply = data["cnt"];

    //return botReply;
  }
}
