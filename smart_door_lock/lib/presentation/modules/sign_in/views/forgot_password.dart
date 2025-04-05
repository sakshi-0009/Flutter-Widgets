import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/validators.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  bool _isButtonPressed = false;
  FocusNode _emailFocusNode = FocusNode();
  bool _showForgotEmail = false;
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        _showForgotEmail = _emailFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
  }

  void _onConfirmPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.toNamed('/forgot_password_otp');
    } else {
      setState(() {
        _isButtonPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/icons/Group 1000005006.png',
                        width: 61,
                        height: 60.98,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                SizedBox(height: 10,),
                Text("Please enter your register Email ID to reset your password. Will send link over the email to reset password",
                    style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                    textAlign: TextAlign.center,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    validator: validateEmailOrPhone,
                    onChanged: (value) {
                      setState(() {
                        _isButtonPressed = _formKey.currentState?.validate() ?? false;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Email ID",
                      border: OutlineInputBorder(),
                      fillColor: Color(0xFFF7F7F7),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Container(
                    child: TextButton(
                      onPressed: _onConfirmPressed,
                      style: TextButton.styleFrom(
                        foregroundColor: _isButtonPressed ? Colors.white : Colors.white,
                        backgroundColor: _isButtonPressed ? Colors.red.shade700 : Colors.grey.shade300,
                        padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 160.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Text("Confirm"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}