import 'package:get/get.dart';

import '../../presentation/modules/create_account/controllers/verify_phone_controller.dart';

class VerifyPhoneBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyPhoneController>(() => VerifyPhoneController());
  }
}
