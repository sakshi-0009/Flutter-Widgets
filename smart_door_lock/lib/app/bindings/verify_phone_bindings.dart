import 'package:get/get.dart';

import 'package:europa_lock/presentation/modules/create_account/controllers/verify_phone_controller.dart';

class VerifyPhoneBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyPhoneController>(() => VerifyPhoneController());
  }
}
