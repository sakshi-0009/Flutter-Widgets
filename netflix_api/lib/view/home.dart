import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<String> popularMovieImages = [];
  List<String> topRatedMovieImages = [];
  List<String> upcomingMovieImages = [];

  Future<void> fetchMovieData(String category) async {
    const apiKey = '3f09cb2d21fbd4c66c24303848152454';
    final url = 'https://api.themoviedb.org/3/movie/$category?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List results = data['results'];

        if (category == 'popular') {
          setState(() {
            popularMovieImages = results
                .map((movie) =>
            'https://image.tmdb.org/t/p/w500${movie['poster_path']}')
                .toList();
          });
        } else if (category == 'top_rated') {
          setState(() {
            topRatedMovieImages = results
                .map((movie) =>
            'https://image.tmdb.org/t/p/w500${movie['poster_path']}')
                .toList();
          });
        } else if (category == 'upcoming') {
          setState(() {
            upcomingMovieImages = results
                .map((movie) =>
            'https://image.tmdb.org/t/p/w500${movie['poster_path']}')
                .toList();
          });
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> sendPostRequest() async {
    const apiUrl = 'https://api.themoviedb.org/3/movie/11/videos?api_key=3f09cb2d21fbd4c66c24303848152454'; // Replace with your API endpoint

    final Map<String, dynamic> postData = {
      'title': 'Sikandar',
      'release_date': '2025-04-15',
      'description': 'A thrilling new movie release',
      'poster_path': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZoGYgRALtwrwDMK7wXF6T7juUQbi5KMaIxA&s', // Example poster image
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(postData),
      );

      if (response.statusCode == 200) {
        setState(() {
          upcomingMovieImages.add(
            'https://image.tmdb.org/t/p/w500${postData['poster_path']}',
          );
        });
        print('Data sent successfully!');
      } else {
        print('Failed to send data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovieData("popular");
    fetchMovieData("top_rated");
    fetchMovieData("upcoming");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CineBuddy",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.search, size: 30, color: Colors.black),
          ),
        ],
      ),
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Sakshi',style: TextStyle(color: Colors.black),),
              accountEmail: Text('sakhi.gome@tudip.com',style: TextStyle(color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/w3images/avatar4.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Languages'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Downloads'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_outlined),
              title: Text('Favourites'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Popular movies
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Text(
                    'Popular Movies',
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularMovieImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                popularMovieImages[index],
                                width: 150,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Top Rated Movies
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Text(
                    'Top Rated Movies',
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: topRatedMovieImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              topRatedMovieImages[index],
                              width: 150,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Upcoming Movies
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Text(
                    'Upcoming Movies',
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: upcomingMovieImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              upcomingMovieImages[index],  // This will show the new movie poster
                              width: 150,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: sendPostRequest,
                child: Text('Send Movie Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}