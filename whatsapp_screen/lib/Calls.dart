import 'package:flutter/material.dart';

import 'BottomNav.dart';

class CallsPage extends StatelessWidget{
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.green),
      home: BottomNav(),
    );
  }
}
