import 'package:get/get.dart';
import '../../presentation/modules/profile/user_manual/user_manual_controller.dart';

class UserManualBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserManualController>(() => UserManualController());
  }
}
