import 'package:flutter/material.dart';

void main(){
  runApp (CallsPage());
}

class CallsPage extends StatelessWidget{
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calls", style: TextStyle(fontSize: 30)),
          actions: [
            Icon(Icons.qr_code, size: 30),
            Icon(Icons.search, size: 30),
          ],
        ),
        body: Center(
          child: Text("No  recent Calls", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}