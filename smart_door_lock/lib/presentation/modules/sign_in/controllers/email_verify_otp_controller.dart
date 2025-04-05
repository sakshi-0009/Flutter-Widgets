import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';

class EmailVerifyOtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otpController = OtpFieldController();
  var isButtonEnabled = false.obs;
  var otpValue = ''.obs;
  var remainingTime = 120.obs;
  Timer? _timer;

  String get formattedTime {
    int minutes = remainingTime.value ~/ 60;
    int seconds = remainingTime.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    remainingTime.value = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void onOtpChanged(String value) {
    otpValue.value = value;
    isButtonEnabled.value = value.length == 4;
  }

  void onOtpCompleted(String value) {
    otpValue.value = value;
    isButtonEnabled.value = value.length == 4;
  }

  void onConfirmPressed() {
    if (otpValue.value.length == 4) {
      Get.toNamed('/email_restored_successfully');
    }
  }

  void onResendPressed() {
    otpValue.value = '';
    isButtonEnabled.value = false;
    otpController.clear();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
