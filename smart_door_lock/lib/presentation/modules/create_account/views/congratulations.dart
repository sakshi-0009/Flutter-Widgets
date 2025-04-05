import 'package:europa_lock/presentation/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Congrats extends StatefulWidget {
  const Congrats({super.key});

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  final _formKey = GlobalKey<FormState>();

  void onVerifyPressed() {
    Get.to(Home());
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
                    padding: const EdgeInsets.only(top: 100),
                    child: Image.asset(
                      'assets/icons/Group 1000004911.png',
                      width: 140,
                      height: 140,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 10),
              Text("Your account created successfully",
                style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                textAlign: TextAlign.center,),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: TextButton(
                    onPressed:(){
                      onVerifyPressed();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red.shade700,
                      padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 150.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text("Get Started"),
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
