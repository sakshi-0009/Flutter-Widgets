import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestoredEmail extends StatefulWidget {
  const RestoredEmail({super.key});

  @override
  State<RestoredEmail> createState() => _RestoredEmailState();
}

class _RestoredEmailState extends State<RestoredEmail> {
  final _formKey = GlobalKey<FormState>();

  void onSignInPressed() {
    Get.toNamed('/sign_in');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 130),
                    child: Image.asset(
                      'assets/icons/Group 1000004909.png',
                      width: 130,
                      height: 130,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Email Restored Successfully",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 10),
              Text("Your Email ID has been successfully restored using phone number verification",
                style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text("sakshi.gome@gmail.com",
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: TextButton(
                    onPressed:(){
                      onSignInPressed();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red.shade700,
                      padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 170.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text("Sign In"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
