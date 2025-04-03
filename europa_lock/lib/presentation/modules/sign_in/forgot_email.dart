import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:europa_lock/core/utils/validators.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonPressed = false;
  String _selectedCountryCode = '+91';
  final _phoneController = TextEditingController();

  void _onConfirmPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isButtonPressed = true;
      });
      Get.toNamed('/email_verify_otp');
    }
  }

  void _validateForm() {
    setState(() {
      _isButtonPressed = _formKey.currentState?.validate() ?? false;
    });
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
                Text("Forgot Email ID?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                SizedBox(height: 10),
                Text(
                  "Please enter your registered Phone Number to reset your Email ID.",
                  style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          value: _selectedCountryCode,
                          items: ['+91', '+1', '+32', '+43', '+44', '+54', '+61']
                              .map((code) => DropdownMenuItem(
                            value: code,
                            child: Text(code),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCountryCode = value!;
                            });
                            _validateForm();  // Validate form on dropdown change
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Color(0xFFF7F7F7),
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: validatePhone,
                          onChanged: (value) => _validateForm(), // Validate form when typing
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(),
                            fillColor: Color(0xFFF7F7F7),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: TextButton(
                    onPressed: _onConfirmPressed,
                    style: TextButton.styleFrom(
                      foregroundColor: _isButtonPressed ? Colors.white : Colors.grey,
                      backgroundColor: _isButtonPressed ? Colors.red.shade700 : Colors.grey.shade300,
                      padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 160.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text("Confirm"),
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
