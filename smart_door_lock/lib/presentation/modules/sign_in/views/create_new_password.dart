import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:europa_lock/core/utils/validators.dart';
import 'package:europa_lock/presentation/modules/sign_in/controllers/create_new_password_controller.dart';

class CreateNewPassword extends GetView<CreateNewPasswordController> {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/Group 1000005006.png',
                  width: 61,
                  height: 60.98,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Create New Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Text(
                  "To create a new password you need to fill following details.",
                  style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Obx(() => TextFormField(
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocusNode,
                  obscureText: !controller.isPasswordVisible.value,
                  validator: validatePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    fillColor: const Color(0xFFF7F7F7),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                )),
                const SizedBox(height: 10),
                Obx(() => TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  onChanged: (_) => controller.checkPasswordsMatch(),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                    fillColor: const Color(0xFFF7F7F7),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                  ),
                )),
                Obx(() => controller.passwordMatchMessage.value != null
                    ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.passwordMatchMessage.value!,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
                    : const SizedBox()),
                const SizedBox(height: 20),
                Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isButtonEnabled.value
                        ? controller.onChangePressed
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.isButtonEnabled.value
                          ? Colors.red.shade700
                          : Colors.grey.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
