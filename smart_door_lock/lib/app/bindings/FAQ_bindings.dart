import 'package:europa_lock/presentation/modules/profile/FAQ/FAQ_controller.dart';
import 'package:get/get.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(() => FaqController());
  }
}
