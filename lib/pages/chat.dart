import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/services/bot.dart';
import 'package:chatbot/services/chatbubble.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

List<ChatBubble> messages = [];

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  String bot = "";

  void Endscroll() {
    final position = scrollController.position.maxScrollExtent + 500;

    scrollController.animateTo(position,
        duration: Duration(seconds: 1), curve: Curves.easeOut);
  }

  void BotReply(String userReply) async {
    Bot instance = Bot();
    await instance.getChatbotReply(userReply);

    bot = instance.botReply;

    setState(() {
      ChatBubble msg = ChatBubble(messageContent: bot, messageType: "receiver");
      messages.add(msg);
    });

    Endscroll();
  }

  @override
  void initState() {
    super.initState();

    //BotReply('Hi');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Color.fromARGB(255, 54, 133, 167),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 224, 215, 215),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              //messages.clear();
            },
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/sheldon.jpg'),
              ),
              SizedBox(width: 15.0),
              Text(
                'Sheldon',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontFamily: 'PoorStory-Regular',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: false,
          leadingWidth: 30.0,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        //controller: scrollController,
                        shrinkWrap: true,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: messages[index].messageType == "receiver"
                                ? EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 0.0)
                                : EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 0.0),
                            child: messages[index].messageType == "receiver"
                                ? BubbleSpecialOne(
                                    text: messages[index].messageContent,
                                    textStyle: TextStyle(
                                      fontFamily: 'PoorStory-Regular',
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    isSender: false,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  )
                                : BubbleSpecialOne(
                                    text: messages[index].messageContent,
                                    textStyle: TextStyle(
                                      fontFamily: 'PoorStory-Regular',
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    isSender: true,
                                    color: Color.fromARGB(255, 125, 236, 249),
                                    seen: true,
                                  ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: Endscroll,
                      controller: textController,
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          height: 40.0,
                          width: 40.0,
                          margin: EdgeInsets.fromLTRB(0.0, 10.0, 12.0, 10.0),
                          child: FloatingActionButton(
                            onPressed: () {
                              if (textController.text.isNotEmpty) {
                                setState(() {
                                  messages.add(ChatBubble(
                                      messageContent: textController.text,
                                      messageType: "sender"));
                                });

                                BotReply(textController.text);
                                Endscroll();

                                textController.clear();
                              }
                            },
                            splashColor: Color.fromARGB(255, 34, 17, 221),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(15.0, 15.0, 10.0, 0.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 128, 124, 124)),
                        hintText: 'Write anything',
                      ),
                      cursorColor: Colors.blue,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontFamily: 'PoorStory-Regular'),
                      enabled: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
