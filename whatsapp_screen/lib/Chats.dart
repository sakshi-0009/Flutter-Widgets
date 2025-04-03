import 'package:flutter/material.dart';

import 'BottomNav.dart';

class ChatsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp", style: TextStyle(fontSize: 30),),
        backgroundColor: Color(0xFF1FAA5F),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:350),
        child: Center(
          child: Column(
            children: [
              Text("Log In", style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),
                ));
              },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
