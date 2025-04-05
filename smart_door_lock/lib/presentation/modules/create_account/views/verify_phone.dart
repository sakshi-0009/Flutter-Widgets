import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../controllers/verify_phone_controller.dart';

class VerifyPhone extends GetView<VerifyPhoneController> {
  const VerifyPhone({super.key});

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
                SizedBox(height: 20),
                Image.asset(
                  'assets/icons/Group 1000004910.png',
                  width: 130,
                  height: 130,
                ),
                Text(
                  "Verify Phone Number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "We have sent the OTP on your phone number 7447652354 ",
                        style: TextStyle(color: Color(0xFF666A74), fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/create_account'),
                      child: Text(
                        " Change",
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                OTPTextField(
                  controller: controller.otpController,
                  length: 4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fieldWidth: 50,
                  style: TextStyle(fontSize: 18),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: controller.onChanged,
                  onCompleted: controller.onCompleted,
                ),
                SizedBox(height: 20),
                Obx(() => Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: TextButton(
                    onPressed:
                    controller.isButtonEnabled.value ? controller.onConfirmPressed : null,
                    style: TextButton.styleFrom(
                      foregroundColor: controller.isButtonEnabled.value ? Colors.white : Colors.grey,
                      backgroundColor: controller.isButtonEnabled.value
                          ? Colors.red.shade700
                          : Colors.grey.shade300,
                      padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 170.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text("Verify"),
                  ),
                )),
                Obx(() => RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Code will expire in ",
                        style: TextStyle(color: Color(0xFF666A74), fontSize: 18),
                      ),
                      TextSpan(
                        text: controller.formatTime(controller.remainingTime.value),
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 20),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I did not receive the code",
                      style: TextStyle(color: Color(0xFF666A74), fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: controller.remainingTime.value == 0
                          ? controller.onResendPressed
                          : null,
                      child: Text(
                        " Resend",
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
