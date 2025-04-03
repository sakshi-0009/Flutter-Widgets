import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Home extends StatefulWidget {
  late final String selectedLanguage;

  Home({required this.selectedLanguage});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.loginform),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: Colors.white38,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black54, // Border color
                  width: 4, // Border width
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://plus.unsplash.com/premium_vector-1726343077821-7cc0cbc840c9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxhcHRvcCUyMGFuZCUyMGNvZmZlZXxlbnwwfHwwfHx8MA%3D%3D',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: (AppLocalizations.of(context)!.username),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: (AppLocalizations.of(context)!.password),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                _usernameController.clear();
                _passwordController.clear();
              },
              child: Text(AppLocalizations.of(context)!.submit, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                backgroundColor: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _socialMediaButton(Icons.facebook, Colors.blue),
                _socialMediaButton(Icons.camera_alt, Colors.pinkAccent),
                _socialMediaButton(Icons.mail, Colors.red),  // Gmail Icon
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialMediaButton(IconData icon, Color color) {
    return ElevatedButton(
      onPressed: () {
        print('$icon button pressed');
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: color,
      ),
      child: Icon(icon, size: 30, color: Colors.white),
    );
  }
}
