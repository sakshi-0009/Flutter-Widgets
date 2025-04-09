import 'package:get/get.dart';
import 'package:europa_lock/presentation/modules/sign_in/controllers/password_controller.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordController>(() => PasswordController());
  }
}
