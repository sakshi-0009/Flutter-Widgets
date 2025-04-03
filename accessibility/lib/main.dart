import 'package:accessibility/semantics.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: semantics(),
      title: "Accessibility",
      debugShowCheckedModeBanner: false,
    );
  }
}
