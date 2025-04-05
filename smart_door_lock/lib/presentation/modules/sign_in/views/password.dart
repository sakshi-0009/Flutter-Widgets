import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/validators.dart';
import '../controllers/password_controller.dart';

class Password extends GetView<PasswordController> {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/icons/Group 1000005006.png',
                      width: 61,
                      height: 60.98,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Enter Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocusNode,
                  obscureText: !controller.isPasswordVisible.value,
                  validator: validatePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    fillColor: const Color(0xFFF7F7F7),
                    filled: true,
                    suffixIcon: Obx(() => IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: controller.navigateToForgotPassword,
                child: Obx(() => Visibility(
                  visible: controller.showForgotPassword.value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 250.0, bottom: 10.0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: controller.onContinuePressed,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 170.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text("Sign In"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
