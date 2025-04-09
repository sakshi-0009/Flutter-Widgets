import 'package:get/get.dart';

import 'package:europa_lock/presentation/modules/sign_in/controllers/email_verify_otp_controller.dart';

class EmailVerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailVerifyOtpController>(() => EmailVerifyOtpController());
  }
}
