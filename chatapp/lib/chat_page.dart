import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi Sakshi!"),
        backgroundColor: Colors.transparent,
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                print("Clicked!");
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Container(),
    );
  }
}
