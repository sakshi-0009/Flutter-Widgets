import 'package:get/get.dart';
import 'package:europa_lock/presentation/modules/create_account/controllers/create_account_controller.dart';

class CreateAccountBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(() => CreateAccountController());
  }
}
