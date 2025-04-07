import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:europa_lock/presentation/modules/create_account/controllers/create_account_controller.dart';
import 'package:europa_lock/presentation/modules/create_account/views/privacy_policy.dart';
import 'package:europa_lock/presentation/modules/create_account/views/terms_and_conditions.dart';
import 'package:europa_lock/core/utils/validators.dart';

class CreateAccount extends GetView<CreateAccountController> {
  const CreateAccount({super.key});

  bool isPhoneNumber(String input) {
    final phoneRegex = RegExp(r"^\d{10}$");
    return phoneRegex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Create New Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                    fillColor: Color(0xFFF7F7F7),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email ID",
                    border: OutlineInputBorder(),
                    fillColor: Color(0xFFF7F7F7),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'^[a-z0-9.]+@[a-z]+\.[a-z]{2,4}$')
                        .hasMatch(value.trim())) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: DropdownButtonFormField<String>(
                        value: controller.selectedCountryCode,
                        items: ['+91', '+1', '+32', '+43', '+44', '+54', '+61']
                            .map((code) =>
                            DropdownMenuItem(value: code, child: Text(code)))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.updateCountryCode(value);
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Color(0xFFF7F7F7),
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        maxLength:
                        isPhoneNumber(controller.phoneController.text) ? 10 : null,
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        validator: validatePhone,
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          border: OutlineInputBorder(),
                          fillColor: Color(0xFFF7F7F7),
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              buildSearchField("State"),
              buildSearchField("City"),

              Obx(() => buildPasswordField(
                label: "Password",
                controller: controller.passwordController,
                isPasswordVisible: controller.isPasswordVisible.value,
                onToggleVisibility: controller.togglePasswordVisibility,
                validator: validatePassword,
              )),
              Obx(() => buildPasswordField(
                label: "Confirm Password",
                controller: controller.confirmPasswordController,
                isPasswordVisible: controller.isConfirmPasswordVisible.value,
                onToggleVisibility: controller.toggleConfirmPasswordVisibility,
                validator: validateConfirmPassword,
                onChanged: (_) => controller.checkPasswordsMatch(),
              )),

              Obx(() {
                if (controller.passwordMatchMessage.value != null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      controller.passwordMatchMessage.value!,
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),

              Row(
                children: [
                  Obx(() => Checkbox(
                    value: controller.isChecked.value,
                    onChanged: (value) =>
                    controller.isChecked.value = value!,
                  )),
                  const Text("I agree to ", style: TextStyle(fontSize: 13)),
                  GestureDetector(
                    onTap: () => Get.to(PrivacyPolicy()),
                    child: Text("Privacy Policy ",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Text("and ", style: TextStyle(fontSize: 13)),
                  GestureDetector(
                    onTap: () => Get.to(TermsAndConditions()),
                    child: Text("Terms & Conditions",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Obx(() => ElevatedButton(
                onPressed:
                controller.isChecked.value ? controller.createForm : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: controller.isChecked.value
                      ? Colors.white
                      : Colors.black,
                  backgroundColor: controller.isChecked.value
                      ? Colors.red.shade700
                      : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Create Account"),
              )),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account? ", style: TextStyle(fontSize: 17)),
                  GestureDetector(
                    onTap: () {
                      controller.resetForm();
                      Get.toNamed('/sign_in');
                    },
                    child: Text("Sign In",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),

              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => print("Sign in with google clicked"),
                  icon: Image.asset('assets/icons/google_logo.png',
                      width: 40, height: 30),
                  label: const Text("Sign in with Google",
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
    required String? Function(String?) validator,
    void Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: !isPasswordVisible,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          fillColor: const Color(0xFFF7F7F7),
          filled: true,
          suffixIcon: IconButton(
            icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: onToggleVisibility,
          ),
        ),
      ),
    );
  }

  Widget buildSearchField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          fillColor: const Color(0xFFF7F7F7),
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
