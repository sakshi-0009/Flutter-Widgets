import 'package:get/get.dart';

import '../../presentation/modules/sign_in/controllers/phone_verify_otp_controller.dart';

class PhoneVerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneVerifyOtpController>(() => PhoneVerifyOtpController());
  }
}
