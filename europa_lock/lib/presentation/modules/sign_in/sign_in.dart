import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/validators.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
  void _onContinuePressed() {
    if (_formKey.currentState?.validate() ?? false) {
      String input = _emailController.text.trim();

      if (_isEmail(input)) {
        Get.toNamed('/password');
      } else if (_isPhoneNumber(input)) {
        Get.toNamed('/phone_verify_otp');
      } else {
        Get.snackbar("Error", "Please enter a valid Email ID or Phone Number",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  bool _isEmail(String input) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(input);
  }

  bool _isPhoneNumber(String input) {
    final phoneRegex = RegExp(r"^\d{10}$"); // Matches exactly 10 digits
    return phoneRegex.hasMatch(input);
  }


  void _navigateToForgotEmail() {
    Get.toNamed('/forgot_email');
  }

  void _signInWithGoogle() {
    print('Sign in with Google clicked');
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
                Text("Sign In to Your Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                      labelText: "Email ID or Phone Number",
                      border: OutlineInputBorder(),
                      fillColor: Color(0xFFF7F7F7),
                      filled: true,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _navigateToForgotEmail,
                  child: Visibility(
                    visible: _showForgotEmail,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 250.0, bottom: 10.0),
                      child: Text(
                        "Forgot Email ID?",
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Container(
                    child: TextButton(
                      onPressed: _onContinuePressed,
                      style: TextButton.styleFrom(
                        foregroundColor: _isButtonPressed ? Colors.white : Colors.grey.shade700,
                        backgroundColor: _isButtonPressed ? Colors.red.shade700 : Colors.grey.shade300,
                        padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 160.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Text("Continue"),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => Get.toNamed('/create_account'),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _signInWithGoogle,
                      icon: Image.asset('assets/icons/google_logo.png', width: 40, height: 30),
                      label: Text("Sign in with Google", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
