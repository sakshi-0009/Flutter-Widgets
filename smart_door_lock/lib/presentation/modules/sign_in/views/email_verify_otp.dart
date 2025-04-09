import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:europa_lock/presentation/modules/sign_in/controllers/email_verify_otp_controller.dart';

class EmailOtp extends GetView<EmailVerifyOtpController> {
  const EmailOtp({super.key});

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
                const Text("Enter OTP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: const Text(
                        "We have sent the OTP on your phone number 7447652354 ",
                        style: TextStyle(color: Color(0xFF666A74), fontSize: 12),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/forgot_email'),
                      child: Text(" Change", style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                OTPTextField(
                  controller: controller.otpController,
                  length: 4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 18),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: controller.onOtpChanged,
                  onCompleted: controller.onOtpCompleted,
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Obx(() => TextButton(
                    onPressed: controller.isButtonEnabled.value ? controller.onConfirmPressed : null,
                    style: TextButton.styleFrom(
                      foregroundColor: controller.isButtonEnabled.value ? Colors.white : Colors.grey,
                      backgroundColor: controller.isButtonEnabled.value ? Colors.red.shade700 : Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 160.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: const Text("Confirm"),
                  )),
                ),

                Obx(() => RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Code will expire in ",
                        style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                      ),
                      TextSpan(
                        text: controller.formattedTime,
                        style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I did not receive the code", style: TextStyle(color: Color(0xFF666A74), fontSize: 16)),
                    Obx(() => GestureDetector(
                      onTap: controller.remainingTime.value == 0 ? controller.onResendPressed : null,
                      child: Text(" Resend", style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
