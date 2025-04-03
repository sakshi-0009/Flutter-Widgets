import 'package:flutter/material.dart';

class semantics extends StatelessWidget {
  const semantics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Semantics(
            label: 'Semantics',
            child: Text('Home Screen'),
          ),
          backgroundColor: Color.fromARGB(200, 204, 153, 255),
          centerTitle: true,
          leading: Icon(Icons.photo),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.add_a_photo),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Semantics(
                label: 'A network image of a beautiful sunset',
                child: Image.network(
                  'https://images.unsplash.com/photo-1585910165033-3facaf6984d9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3Vuc2V0c3xlbnwwfHwwfHx8MA%3D%3D',
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Semantics(
                label: 'Text description: This is a text under the image',
                child: Text(
                  'A beautiful sunset',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Semantics(
                label: 'A network image of a beautiful sunset',
                child: Image.network(
                  'https://plus.unsplash.com/premium_photo-1673002094029-7b23531aa342?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Semantics(
                label: 'Text description: This is a text under the image',
                child: Text(
                  'Sunset and Peace',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Semantics(
                label: 'A network image of a beautiful sunset',
                child: Image.network(
                  'https://plus.unsplash.com/premium_photo-1673002094195-f18084be89ce?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c3Vuc2V0c3xlbnwwfHwwfHx8MA%3D%3D',
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Semantics(
                label: 'Text description: This is a text under the image',
                child: Text(
                  'Sunset and Mountains',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
    );
  }
}
