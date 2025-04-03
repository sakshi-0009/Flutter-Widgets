import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/validators.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _PasswordState();
}

class _PasswordState extends State<NewPassword> {
  FocusNode _passwordFocusNode = FocusNode();
  bool _isButtonPressed = false;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _passwordMatchMessage;
  bool _isButtonEnabled = false;


  void _onChangePressed() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.offNamed('/sign_in');
      Get.snackbar(
        "Success",
        "Password changed successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        borderRadius: 0,
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.check_circle, color: Colors.white),
        mainButton: TextButton(
          onPressed: () => Get.back(),
          child: Icon(Icons.close, color: Colors.white),
        ),
      );
    } else {
      setState(() {
        _isButtonPressed = false;
      });
    }
  }
  void _checkPasswordsMatch() {
    setState(() {
      _passwordMatchMessage =
      _confirmPasswordController.text == _passwordController.text &&
          _passwordController.text.isNotEmpty
          ? "Password Matched"
          : null;
      _isButtonEnabled = _passwordMatchMessage != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/icons/Group 1000005006.png',
                width: 61,
                height: 60.98,
              ),
              const SizedBox(height: 20),
              const Text(
                "Create New Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text("To create a new password you need to fill following details.",
                style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              TextFormField(
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
              const SizedBox(height: 10),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                onChanged: (_) => _checkPasswordsMatch(),
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFF7F7F7),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              if (_passwordMatchMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 220.0),
                    child: Text(
                      _passwordMatchMessage!,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? _onChangePressed : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled ? Colors.red.shade700 : Colors.grey.shade400,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    "Change Password",
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
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
