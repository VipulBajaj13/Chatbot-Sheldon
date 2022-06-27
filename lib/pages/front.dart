import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Front extends StatefulWidget {
  const Front({Key? key}) : super(key: key);

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(239, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/chat.gif',
                  height: 200,
                  width: 200,
                  color: Colors.white,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
            child: SizedBox(
              height: 50.0,
              child: Text(
                'Hi! This is Sheldon',
                style: TextStyle(
                  fontFamily: 'Dekko',
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
            child: SizedBox(
              height: 35.0,
              child: Text(
                'Wanna Talk with me ?',
                style: TextStyle(
                  fontFamily: 'Dekko',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
              child: Text(
                'Chat Now',
                style: TextStyle(
                  fontFamily: 'Dekko',
                  fontSize: 40.0,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
