import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String email;
  final String password;

  const HomePage({
    super.key,
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Hi $username"),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://plus.unsplash.com/premium_vector-1721862407108-86f46a986933?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Home Page!",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black26,  // Slight transparency for the container
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text("User Credentials", style: TextStyle(fontSize: 23,color: Colors.white),),
                      Text('Username: $username', style: TextStyle(fontSize: 18, color: Colors.white),),
                      Text('Email: $email', style: TextStyle(fontSize: 18, color: Colors.white),),
                      Text('Password: $password', style: TextStyle(fontSize: 18, color: Colors.white),),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, "Logged In Successfully");
                  },
                  child: Text("Back"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
