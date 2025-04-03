import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/utils/validators.dart';

class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _PasswordState();
}

class _PasswordState extends State<password> {
  bool _isButtonPressed = false;
  FocusNode _passwordFocusNode = FocusNode();
  bool _showForgotPassword = false;
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _showForgotPassword = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordFocusNode.dispose();
  }

  void _onContinuePressed() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.toNamed('/home'); // Changed from Navigator.push()
    }
  }

  void _navigateToForgotPassword() {
    Get.toNamed('/forgot_password'); // Changed from Navigator.push()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
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
              Text("Enter Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: !_isPasswordVisible,
                  validator: validatePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    fillColor: Color(0xFFF7F7F7),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _navigateToForgotPassword,
                child: Visibility(
                  visible: _showForgotPassword,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 250.0, bottom: 10.0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: TextButton(
                    onPressed: _onContinuePressed,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: _isButtonPressed ? Colors.red.shade700 : Colors.red.shade700,
                      padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 170.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text("Sign In"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
