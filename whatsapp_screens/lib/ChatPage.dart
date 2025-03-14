import 'package:flutter/material.dart';

void main(){
  runApp (ChatPage());
}

class ChatPage extends StatelessWidget{
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          titleTextStyle: TextStyle(color: Colors.green, fontSize: 30),
          actions: [
            Icon(Icons.favorite_sharp, size: 30),
            Icon(Icons.qr_code, size: 30),
            Icon(Icons.camera_alt_sharp, size: 30),
            Icon(Icons.search, size: 30),
          ],
        ),
        body: Center(
          child: Text("Hello Sakshi", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}