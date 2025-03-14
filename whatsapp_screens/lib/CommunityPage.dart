import 'package:flutter/material.dart';

void main(){
  runApp (CommunityPage());
}

class CommunityPage extends StatelessWidget{
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Communities", style: TextStyle(fontSize: 30)),
          actions: [
            Icon(Icons.qr_code, size: 30),
            Icon(Icons.search, size: 30),
          ],
        ),
        body: Center(
          child: Text("Create new Community", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}