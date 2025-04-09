import 'dart:async';
import 'package:europa_lock/presentation/modules/create_account/controllers/verify_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../views/verify_phone.dart';

class VerifyEmailController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otpController = OtpFieldController();

  var isButtonEnabled = false.obs;
  var otpValue = ''.obs;  //stores current OTP input

  var remainingTime = 120.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  // Start timer:
  void startTimer() {
    _timer?.cancel();   //cancels previous timer
    remainingTime.value = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  // Format timer:
  String formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;  //calculates full minutes
    int seconds = timeInSeconds % 60;   //remaining seconds after taking out the full minutes
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';   //It combines minutes and seconds like a string
    // It makes sure that number has at least 2 digits adding a 0 in front if needed.
  }

  void onOtpChanged(String pin) {
    otpValue.value = pin;
    isButtonEnabled.value = pin.length == 4;
  }

  void onOtpCompleted(String pin) {
    otpValue.value = pin;
    isButtonEnabled.value = pin.length == 4;
  }

  void onConfirmPressed() {
    if (otpValue.value.length < 4) return;
    Get.put(VerifyPhoneController());
    Get.to(() => VerifyPhone());
  }

  void onResendPressed() {
    otpValue.value = '';
    isButtonEnabled.value = false;
    otpController.clear();
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}