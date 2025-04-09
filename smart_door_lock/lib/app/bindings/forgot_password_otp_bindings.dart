import 'package:get/get.dart';
import 'package:europa_lock/presentation/modules/sign_in/controllers/forgot_password_otp_controller.dart';

class ForgotPasswordOtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordOtpController>(() => ForgotPasswordOtpController());
  }
}
