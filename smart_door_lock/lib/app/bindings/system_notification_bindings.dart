import 'package:get/get.dart';
import '../../presentation/modules/profile/system_notification/system_notification_controller.dart';

class SystemNotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SystemNotificationController>(() => SystemNotificationController());
  }
}
