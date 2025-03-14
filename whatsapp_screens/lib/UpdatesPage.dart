import 'package:flutter/material.dart';

void main(){
  runApp (UpdatesPage());
}

class UpdatesPage extends StatelessWidget{
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Updates", style: TextStyle(fontSize: 30)),
          actions: [
            Icon(Icons.qr_code, size: 30),
            Icon(Icons.search, size: 30),
          ],
        ),
        body: Center(
          child: Text("No Updates", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}