import 'package:flutter/material.dart';
import 'main.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int selectedindex = 0;

  // PageController pageController = PageController();

  List<Widget>widgets = [
    Center(child: Text("Chats", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
    Center(child: Text("Updates", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
    Center(child: Text("Community", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
    Center(child: Text("Calls", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
  ];
  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp", style: TextStyle(fontSize: 30),),
        backgroundColor: Color(0xFF1FAA5F),
      ),
      body: widgets.elementAt(selectedindex),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem
              (icon: Icon
              (Icons.chat),
                label: "Chats"),
            BottomNavigationBarItem
              (icon: Icon
              (Icons.update),
                label: "Updates"),
            BottomNavigationBarItem
              (icon: Icon
              (Icons.group),
                label: "Community"),
            BottomNavigationBarItem
              (icon: Icon
              (Icons.call),
                label: "Calls"),
          ],
          currentIndex: selectedindex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
      ),
    );
  }
}
