import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign key to Scaffold
      appBar: AppBar(
        title: const Text("Student Data Management"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu), // Hamburger icon
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.orangeAccent,
        child: Column(
          children: [
            const DrawerHeader(
              child: Text(
                "DashBoard",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            drawerItem(Icons.person, "Profile"),
            drawerItem(Icons.fastfood, "Food"),
            drawerItem(Icons.note_add, "Notes"),
            drawerItem(Icons.settings, "Settings"),
            drawerItem(Icons.logout, "Logout"),
          ],
        ),
      ),
      body: const Center(
        child: Text("Home Page", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  // Drawer Item Widget for reusability
  Widget drawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 15),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
