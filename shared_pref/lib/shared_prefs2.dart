import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPreferencesExample(),
    );
  }
}

class SharedPreferencesExample extends StatefulWidget {
  @override
  _SharedPreferencesExampleState createState() => _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  TextEditingController _controller = TextEditingController();
  String _savedName = "No data";

  Future<void> _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller.text);
    _controller.clear();
  }

  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('username') ?? "No data";
    });
  }

  Future<void> _clearName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    _loadName();
  }

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: InputDecoration(labelText: 'Enter Name')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _saveName, child: Text('Save')),
            ElevatedButton(onPressed: _loadName, child: Text('Load')),
            ElevatedButton(onPressed: _clearName, child: Text('Clear')),
            SizedBox(height: 20),
            Text('Saved Name: $_savedName'),
          ],
        ),
      ),
    );
  }
}
