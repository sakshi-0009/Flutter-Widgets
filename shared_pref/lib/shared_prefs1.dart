import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();

  static var KEYNAME = "name";
  var nameValue = "No value saved";
  @override

  void initState(){
    super.initState();
    getValue();
  }
  void getValue() async{

  var prefs = await SharedPreferences.getInstance();
  
  var getname =  prefs.getString(KEYNAME);

  nameValue = getname ?? "No value saved";

  setState(() {

  });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Shared Preferences"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text('Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)
                  )
                ),
              ),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(onPressed: () async{
                var name = nameController.text.toString();
                var prefs = await SharedPreferences.getInstance();
                prefs.setString(KEYNAME, nameController.text.toString());
              },
                  child: Text("Save",style: TextStyle(fontSize: 30))),
              SizedBox(
                height: 11,
              ),
              Text(nameValue, style: TextStyle(fontSize: 30))
            ],
          ),
        ),
      ),
    );
  }
}