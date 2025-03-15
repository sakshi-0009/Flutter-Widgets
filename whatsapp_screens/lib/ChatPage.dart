import 'package:flutter/material.dart';

void main(){
  runApp (ChatPage());
}

class ChatPage extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {"name": "Alice", "message": "Hey! How are you?", "image": "assets/images/Prof.jpg"},
    {"name": "Bob", "message": "Let's catch up soon!", "image": "assets/images/Prof.jpg"},
    {"name": "Charlie", "message": "Did you see the news?", "image": "assets/images/Prof.jpg"},
    {"name": "David", "message": "Good morning!", "image": "assets/images/Prof.jpg"},
    {"name": "Eve", "message": "Meeting at 3 PM?", "image": "assets/images/Prof.jpg"},
    {"name": "Alice", "message": "Hey! How are you?", "image": "assets/images/Prof.jpg"},
    {"name": "Bob", "message": "Let's catch up soon!", "image": "assets/images/Prof.jpg"},
    {"name": "Charlie", "message": "Did you see the news?", "image": "assets/images/Prof.jpg"},
    {"name": "David", "message": "Good morning!", "image": "assets/images/Prof.jpg"},
    {"name": "Eve", "message": "Meeting at 3 PM?", "image": "assets/images/Prof.jpg"},
    {"name": "Alice", "message": "Hey! How are you?", "image": "assets/images/Prof.jpg"},
    {"name": "Bob", "message": "Let's catch up soon!", "image": "assets/images/Prof.jpg"},
    {"name": "Charlie", "message": "Did you see the news?", "image": "assets/images/Prof.jpg"},
    {"name": "David", "message": "Good morning!", "image": "assets/images/Prof.jpg"},
    {"name": "Eve", "message": "Meeting at 3 PM?", "image": "assets/images/Prof.jpg"},
  ];

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chats[index]["image"]!),
            ),
            title: Text(chats[index]["name"]!),
            subtitle: Text(chats[index]["message"]!),
            onTap: () {},
          );
        },
      ),
    );
  }
}