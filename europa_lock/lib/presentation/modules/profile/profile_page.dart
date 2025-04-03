import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          Icon(Icons.logout)
        ],
      ),
      body: Center(child: Text("Profile Page")),
    );
  }
}
