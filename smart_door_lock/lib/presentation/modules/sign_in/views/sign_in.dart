import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:europa_lock/core/utils/validators.dart';
import 'package:europa_lock/presentation/modules/sign_in/controllers/sign_in_controller.dart';

class SignIn extends GetView<SignInController> {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset('assets/icons/Group 1000005006.png', width: 61, height: 61),
                  const SizedBox(height: 20),
                  const Text("Sign In to Your Account",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: controller.emailController,
                      focusNode: controller.emailFocusNode,
                      validator: validateEmailOrPhone,
                      onChanged: controller.onChanged,
                      maxLength: controller.isPhoneNumber(controller.emailController.text) ? 10 : null,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Email ID or Phone Number",
                        border: OutlineInputBorder(),
                        fillColor: Color(0xFFF7F7F7),
                        filled: true,
                        counterText: '',
                      ),
                    ),
                  ),
                  Obx(() => Visibility(
                    visible: controller.showForgotEmail.value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 250.0, bottom: 10.0),
                      child: GestureDetector(
                        onTap: () => Get.toNamed('/forgot_email'),
                        child: Text(
                          "Forgot Email ID?",
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: Obx(() => TextButton(
                      onPressed:
                      controller.isButtonPressed.value ? controller.onContinuePressed : null,
                      style: TextButton.styleFrom(
                        foregroundColor: controller.isButtonPressed.value
                            ? Colors.white
                            : Colors.grey.shade700,
                        backgroundColor: controller.isButtonPressed.value
                            ? Colors.red.shade700
                            : Colors.grey.shade300,
                        padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 160.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text("Continue"),
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () => Get.toNamed('/create_account'),
                        child: Text(
                          "Create account",
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: controller.signInWithGoogle,
                        icon: Image.asset('assets/icons/socialIcon.png', width: 40, height: 30),
                        label: const Text("Sign in with Google", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
