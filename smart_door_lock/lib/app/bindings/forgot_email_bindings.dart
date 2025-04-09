import 'package:get/get.dart';
import 'package:europa_lock/presentation/modules/sign_in/controllers/forgot_email_controller.dart';

class ForgotEmailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotEmailController>(() => ForgotEmailController());
  }
}
