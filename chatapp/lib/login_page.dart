import 'package:flutter/material.dart';

import 'chat_page.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(
        width: 200,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print("Add");
      }),
      body: Column(
        children: [
          Center(
            child: Text(
                "Let\'s Log You In!",
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w400, color: Colors.brown
                )
            ),
          ),
          Container(
            height: 250,
            width: 500,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage('https://plus.unsplash.com/premium_photo-1720192861939-f469be34d5d7?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(24)
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            },
            child: Text("Log In"),
          ),
        ],
      ),
    );
  }
}
