import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isChecked = false.obs;
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  var passwordMatchMessage = RxnString();

  String selectedCountryCode = "+91";
  String? selectedState;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void updateCountryCode(String code) {
    selectedCountryCode = code;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void checkPasswordsMatch() {
    if (confirmPasswordController.text == passwordController.text &&
        passwordController.text.isNotEmpty) {
      passwordMatchMessage.value = null;
    } else {
      passwordMatchMessage.value = "Password Not Matched";
    }
  }

  void createForm() {
    if (formKey.currentState!.validate()) {
      Get.toNamed('/verify_email');
    }
  }

  void resetForm() {
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    formKey.currentState?.reset();
    isChecked.value = false;
    isPasswordVisible.value = false;
    isConfirmPasswordVisible.value = false;
    passwordMatchMessage.value = null;
    selectedState = null;
    selectedCountryCode = "+91";
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
