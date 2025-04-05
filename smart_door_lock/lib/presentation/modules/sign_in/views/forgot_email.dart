import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/forgot_email_controller.dart';

class ForgotEmail extends GetView<ForgotEmailController> {
  const ForgotEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/icons/Group 1000005006.png',
                    width: 61,
                    height: 60.98,
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Forgot Email ID?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Please enter your registered Phone Number to reset your Email ID.",
                    style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          value: controller.selectedCountryCode.value,
                          items: controller.countryCodes
                              .map((code) => DropdownMenuItem(
                            value: code,
                            child: Text(code),
                          ))
                              .toList(),
                          onChanged: controller.onCountryCodeChanged,
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
                          controller: controller.phoneController,
                          focusNode: controller.focusNode,
                          keyboardType: TextInputType.phone,
                          validator: controller.validatePhone,
                          onChanged: (_) => controller.validateForm(),
                          maxLength: 10,
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
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Obx(
                        () => TextButton(
                      onPressed: controller.isButtonPressed.value
                          ? controller.onConfirmPressed
                          : null,
                      style: TextButton.styleFrom(
                        foregroundColor: controller.isButtonPressed.value
                            ? Colors.white
                            : Colors.grey,
                        backgroundColor: controller.isButtonPressed.value
                            ? Colors.red.shade700
                            : Colors.grey.shade300,
                        padding: const EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 160.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text("Confirm"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
