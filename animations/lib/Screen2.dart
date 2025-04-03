import 'package:flutter/material.dart';
import 'Hero.dart';

class Screen2 extends StatelessWidget {
  final Item item; // Define the item to be passed

  Screen2({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title), // Display the title of the item
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: item.title, // Use the same tag for the Hero animation
          child: buildImage(""),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage) => AspectRatio(
    aspectRatio: 1,
    child: Image.network(
      urlImage, // Display the image based on the item
      fit: BoxFit.cover,
    ),
  );
}
