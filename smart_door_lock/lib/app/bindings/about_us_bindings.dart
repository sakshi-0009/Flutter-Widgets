import 'package:get/get.dart';
import '../../presentation/modules/profile/about_us/about_us_controller.dart';

class AboutUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsController>(() => AboutUsController());
  }
}
