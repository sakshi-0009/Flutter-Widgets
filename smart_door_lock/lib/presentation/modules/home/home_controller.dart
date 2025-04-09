import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ever(selectedIndex, (index) {
      if (index == 1) {
        Get.toNamed('/profile_page_view');
      }
    });
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
