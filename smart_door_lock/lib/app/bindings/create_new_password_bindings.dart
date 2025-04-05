import 'package:get/get.dart';
import '../../presentation/modules/sign_in/controllers/create_new_password_controller.dart';

class CreateNewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewPasswordController>(() => CreateNewPasswordController());
  }
}
