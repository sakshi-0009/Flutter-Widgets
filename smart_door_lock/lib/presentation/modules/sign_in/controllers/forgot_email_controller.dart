import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/email_verify_otp.dart';

class ForgotEmailController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final focusNode = FocusNode();

  final selectedCountryCode = '+91'.obs;
  final isButtonPressed = false.obs;

  final countryCodes = ['+91', '+1', '+32', '+43', '+44', '+54', '+61'];

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(() {
      if (_isPhoneNumber(phoneController.text) &&
          phoneController.text.length == 10) {
        focusNode.unfocus();
      }
      validateForm();
    });
  }

  bool _isPhoneNumber(String input) {
    final phoneRegex = RegExp(r"^\d{10}$");
    return phoneRegex.hasMatch(input);
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r"^\d{10}$").hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  void onCountryCodeChanged(String? value) {
    if (value != null) {
      selectedCountryCode.value = value;
      validateForm();
    }
  }

  void validateForm() {
    isButtonPressed.value = formKey.currentState?.validate() ?? false;
  }

  void onConfirmPressed() {
    if (formKey.currentState?.validate() ?? false) {
      Get.to(() => EmailOtp());
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
