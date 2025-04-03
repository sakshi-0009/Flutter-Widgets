import 'package:animations/Screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeroEffect(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Item {
  final String title;
  final String urlImage;

  Item({required this.title, required this.urlImage});
}
class HeroEffect extends StatelessWidget {
  final List<Item> items = [
    Item(
      title: "Item 1",
      urlImage:
      'https://media.istockphoto.com/id/1285465107/photo/loyal-golden-retriever-dog-sitting-on-a-green-backyard-lawn-looks-at-camera-top-quality-dog.jpg?s=612x612&w=is&k=20&c=sv9C2_EIYASIMTkkDAX4tIH1qHheNW93sE0xcSdQiPs=',
    ),
    Item(
      title: "Item 2",
      urlImage:
      'https://media.istockphoto.com/id/1285465107/photo/loyal-golden-retriever-dog-sitting-on-a-green-backyard-lawn-looks-at-camera-top-quality-dog.jpg?s=612x612&w=is&k=20&c=sv9C2_EIYASIMTkkDAX4tIH1qHheNW93sE0xcSdQiPs=',
    ),
    Item(
      title: "Item 3",
      urlImage:
      'https://media.istockphoto.com/id/1285465107/photo/loyal-golden-retriever-dog-sitting-on-a-green-backyard-lawn-looks-at-camera-top-quality-dog.jpg?s=612x612&w=is&k=20&c=sv9C2_EIYASIMTkkDAX4tIH1qHheNW93sE0xcSdQiPs=',
    ),
    Item(
      title: "Item 4",
      urlImage:
      'https://media.istockphoto.com/id/1285465107/photo/loyal-golden-retriever-dog-sitting-on-a-green-backyard-lawn-looks-at-camera-top-quality-dog.jpg?s=612x612&w=is&k=20&c=sv9C2_EIYASIMTkkDAX4tIH1qHheNW93sE0xcSdQiPs=',
    ),
    Item(
      title: "Item 5",
      urlImage:
      'https://media.istockphoto.com/id/1285465107/photo/loyal-golden-retriever-dog-sitting-on-a-green-backyard-lawn-looks-at-camera-top-quality-dog.jpg?s=612x612&w=is&k=20&c=sv9C2_EIYASIMTkkDAX4tIH1qHheNW93sE0xcSdQiPs=',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final item = items[index];

          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Screen2(item: item),
              ),
            ),
            child: Row(
              children: [
                Hero(
                  tag: item.title, // Use a unique identifier (item.title)
                  child: buildImage(item.urlImage),
                ),
                const SizedBox(width: 16),
                Text(
                  'Item ${index + 1}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildImage( String urlImage) => AspectRatio(
    aspectRatio: 1,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
      width: 100,
      height: 100,
    ),
  );
}


