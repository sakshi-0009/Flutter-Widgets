import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  RxBool isButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailFocusNode.addListener(() {
      update();
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.onClose();
  }

  void validateForm() {
    isButtonEnabled.value = formKey.currentState?.validate() ?? false;
  }

  void onConfirmPressed() {
    if (formKey.currentState?.validate() ?? false) {
      Get.toNamed('/forgot_password_otp');
    } else {
      isButtonEnabled.value = false;
    }
  }
}
