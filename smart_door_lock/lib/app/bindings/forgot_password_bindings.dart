import 'package:get/get.dart';
import 'package:europa_lock/presentation/modules/sign_in/controllers/forgot_password_controller.dart';

class ForgotPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
