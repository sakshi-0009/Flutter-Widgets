import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:europa_lock/presentation/modules/profile/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 1) {
      Get.toNamed('/profile'); // Changed from Get.toNamed()
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Center(child: Text("Home Page")),
      Center(child: Text("Profile Page")),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
