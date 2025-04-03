import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation",
      home: FooAnimation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class FooAnimation extends StatefulWidget {

  @override
  State<FooAnimation> createState() => _FooAnimationState();
}

class _FooAnimationState extends State<FooAnimation> {
  var _width = 200.0;
  var _height = 100.0;
  bool flag = true;
  Color _bgColor = Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foo Animations"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(duration: Duration(seconds: 2),
            width: _width,
            height: _height,
            color: _bgColor,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              setState(() {
                if(flag) {
                  _width = 100.0;
                  _height = 200.0;
                  _bgColor = Colors.orange;
                  flag=false;
                } else {
                  _width = 200.0;
                  _height =100.0;
                  _bgColor = Colors.lightGreen;
                  flag=true;
                }
              });
            }, child: Text("Animated"))
          ],
        ),
      ),
    );
  }
}

