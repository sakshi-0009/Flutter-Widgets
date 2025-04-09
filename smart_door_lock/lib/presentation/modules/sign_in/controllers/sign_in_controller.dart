import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Controller initialization:
class SignInController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  final emailFocusNode = FocusNode();

  var isButtonPressed = false.obs;
  var showForgotEmail = false.obs;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(() {
      if (_isPhoneNumber(emailController.text) && emailController.text.length == 10) {
        focusNode.unfocus();
      }
    });

    emailFocusNode.addListener(() {
      showForgotEmail.value = emailFocusNode.hasFocus;
    });
  }

  bool _isPhoneNumber(String input) {
    final phoneRegex = RegExp(r"^\d{10}$");
    return phoneRegex.hasMatch(input);
  }

  bool isPhoneNumber(String input) => _isPhoneNumber(input);

  bool isEmail(String input) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(input);
  }

  //called when input field changes
  void onChanged(String value) {
    isButtonPressed.value = formKey.currentState?.validate() ?? false;
  }

  void onContinuePressed() {
    if (formKey.currentState?.validate() ?? false) {
      String input = emailController.text.trim();

      if (isEmail(input)) {
        Get.toNamed('/password');
      } else if (isPhoneNumber(input)) {
        Get.toNamed('/phone_verify_otp');
      } else {
        Get.snackbar("Error", "Please enter a valid Email ID or Phone Number",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  // Google Sign-in integration
  void signInWithGoogle() {
    print("Sign in with Google clicked");
  }

  // Similar to dispose() in StatefulWidget
  @override
  void onClose() {
    emailController.dispose();
    focusNode.dispose();
    emailFocusNode.dispose();
    super.onClose();
  }
}
