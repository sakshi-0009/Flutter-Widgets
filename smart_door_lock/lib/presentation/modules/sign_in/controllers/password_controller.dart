import 'package:europa_lock/presentation/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  var isPasswordVisible = false.obs;
  var showForgotPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
    passwordFocusNode.addListener(() {
      showForgotPassword.value = passwordFocusNode.hasFocus;
    });
  }

  @override
  void onClose() {
    passwordFocusNode.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void onContinuePressed() {
    if (formKey.currentState?.validate() ?? false) {
      Get.to(HomeView());
    }
  }

  void navigateToForgotPassword() {
    Get.toNamed('/forgot_password');
  }
}
