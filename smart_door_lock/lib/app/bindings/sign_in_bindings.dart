import 'package:get/get.dart';
import 'package:europa_lock/presentation/modules/sign_in/controllers/sign_in_controller.dart';

class SignInBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
