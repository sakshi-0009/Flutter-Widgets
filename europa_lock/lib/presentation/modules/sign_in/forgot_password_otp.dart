import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class ForgotPasswordOtp extends StatefulWidget {
  const ForgotPasswordOtp({super.key});

  @override
  State<ForgotPasswordOtp> createState() => _ForgotPasswordOtpState();
}

class _ForgotPasswordOtpState extends State<ForgotPasswordOtp> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;
  String _otpValue = '';
  OtpFieldController _otpController = OtpFieldController();

  int _remainingTime = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _remainingTime = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  String _formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _onConfirmPressed() {
    if (_otpValue.length < 4) return;
    Get.toNamed('/create_new_password');
  }

  void _onResendPressed() {
    setState(() {
      _otpValue = '';
      _isButtonEnabled = false;
    });
    _otpController.clear();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
                Text(
                  "Enter OTP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "We have sent the OTP on your phone number 7447652354 ",
                        style: TextStyle(color: Color(0xFF666A74), fontSize: 12),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/forgot_password'),
                      child: Text(
                        " Change",
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                OTPTextField(
                  controller: _otpController, // ✅ Assigning controller
                  length: 4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fieldWidth: 50,
                  style: TextStyle(fontSize: 18),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: (pin) {
                    setState(() {
                      _otpValue = pin;
                      _isButtonEnabled = pin.length == 4;
                    });
                  },
                  onCompleted: (pin) {
                    setState(() {
                      _otpValue = pin;
                      _isButtonEnabled = pin.length == 4;
                    });
                  },
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: TextButton(
                    onPressed: _isButtonEnabled ? _onConfirmPressed : null,
                    style: TextButton.styleFrom(
                      foregroundColor: _isButtonEnabled ? Colors.white : Colors.grey,
                      backgroundColor: _isButtonEnabled ? Colors.red.shade700 : Colors.grey.shade300,
                      padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 160.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text("Confirm"),
                  ),
                ),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Code will expire in ",
                        style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                      ),
                      TextSpan(
                        text: _formatTime(_remainingTime),
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I did not receive the code",
                      style: TextStyle(color: Color(0xFF666A74), fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: _remainingTime == 0 ? _onResendPressed : null,
                      child: Text(
                        " Resend",
                        style: TextStyle(
                          color: _remainingTime == 0 ? Colors.red.shade700 : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
