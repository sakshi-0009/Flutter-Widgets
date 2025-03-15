import 'package:flutter/material.dart';
import 'LogIn.dart'; // Import LogInPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInPage(), // Start with LogInPage
    );
  }
}
