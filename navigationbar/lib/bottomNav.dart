import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double s1 = 1.0;
    const double s2 = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("EazyPay", style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Shashank'),
              accountEmail: Text('shashank.gupta@tudip.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/w3images/avatar2.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Languages'),
              onTap: () {
                Navigator.of(context).pop();
                showSnackBar("Select Languages");
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Bill Notification'),
              onTap: () {
                Navigator.of(context).pop();
                showSnackBar("Bill Notification");
              },
            ),
            ListTile(
              leading: Icon(Icons.add_alert),
              title: Text('Reminders'),
              onTap: () {
                Navigator.of(context).pop();
                showSnackBar("Reminders");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).pop();
                showSnackBar("Settings");
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                showSnackBar("Logged out");
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {},
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 35,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                showSnackBar("Home");
              },
              icon: Icon(Icons.home, size: 35,),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                showSnackBar("Search Payment");
              },
              icon: Icon(Icons.search, size: 35,),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                showSnackBar("No Alerts");
              },
              icon: Icon(Icons.call, size: 35,),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                showSnackBar("View History");
              },
              icon: Icon(Icons.add_alert, size: 35,),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
