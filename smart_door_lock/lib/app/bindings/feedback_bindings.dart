import 'package:get/get.dart';
import '../../presentation/modules/profile/feedback/feedback_controller.dart';

class FeedbackBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackController>(() => FeedbackController());
  }
}
