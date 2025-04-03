import 'package:flutter/material.dart';
import 'package:netflix_api/view/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// const apiKey = '3f09cb2d21fbd4c66c24303848152454';
// const url = 'https://api.themoviedb.org/3/movie/popular?api_key=3f09cb2d21fbd4c66c24303848152454';
