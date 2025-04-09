import 'package:get/get.dart';
import '../../presentation/modules/profile/profile_setting/profile_setting_controller.dart';

class ProfileSettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileSettingController>(() => ProfileSettingController());
  }
}
