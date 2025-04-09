import 'dart:async';
import 'package:europa_lock/presentation/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';

class PhoneVerifyOtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otpController = OtpFieldController();

  var otpValue = ''.obs;
  var isButtonEnabled = false.obs;
  var remainingTime = 120.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
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

  String formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
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
    Get.to(HomeView());
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
