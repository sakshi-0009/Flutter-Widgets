import 'package:flutter/material.dart';
import 'Calls.dart';
import 'ChatPage.dart';
import 'CommunityPage.dart';
import 'UpdatesPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;
  final screens = [
    ChatPage(),
    UpdatesPage(),
    CommunityPage(),
    CallsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
          body: screens[index],
          bottomNavigationBar : NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.green.shade100,
            ),
            child: NavigationBar(
                height: 80,
                selectedIndex: index,
                onDestinationSelected: (index) =>
                    setState(() {
                      this.index = index;
                      }
                    ),
                destinations: [
                  NavigationDestination(
                      icon: Icon(Icons.chat),
                      selectedIcon: Icon(Icons.chat),
                      label: "Chats"),
                  NavigationDestination(
                      icon: Icon(Icons.update),
                      label: "Update"),
                  NavigationDestination(
                      icon: Icon(Icons.group),
                      label: "Communities"),
                  NavigationDestination(
                      icon: Icon(Icons.call_sharp),
                      label: "Calls"),
                ]
            ),
          )
      ),

    );
  }
}