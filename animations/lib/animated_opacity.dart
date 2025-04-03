// Opacity value ranges between 0 to 1.

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animated opacity",
      debugShowCheckedModeBanner: false,
      home: animatedOpacity(),
    );
  }
}

class animatedOpacity extends StatefulWidget {

  @override
  State<animatedOpacity> createState() => _animatedOpacityState();
}

class _animatedOpacityState extends State<animatedOpacity> {
  var myOpacity = 1.0;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Opacity"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(opacity: myOpacity,
              duration: Duration(seconds: 1),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.lightBlueAccent,
              ),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              setState(() {
                if(flag) {
                  myOpacity = 0.0;
                  flag=false;
                }else{
                  myOpacity = 1.0;
                  flag=true;
                }
              });
            }, child: Text("Close"))
          ],
        ),
      ),
    );
  }
}

