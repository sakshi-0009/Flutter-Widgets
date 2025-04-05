import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final passwordFocusNode = FocusNode();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var passwordMatchMessage = RxnString();
  var isButtonEnabled = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void checkPasswordsMatch() {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (confirmPassword == password && password.isNotEmpty) {
      passwordMatchMessage.value = "Password Matched";
      isButtonEnabled.value = true;
    } else {
      passwordMatchMessage.value = null;
      isButtonEnabled.value = false;
    }
  }

  void onChangePressed() {
    if (formKey.currentState?.validate() ?? false) {
      Get.offNamed('/sign_in');
      Get.snackbar(
        "Success",
        "Password changed successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        borderRadius: 0,
        margin: const EdgeInsets.all(10),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        mainButton: TextButton(
          onPressed: () => Get.back(),
          child: const Icon(Icons.close, color: Colors.white),
        ),
      );
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}
