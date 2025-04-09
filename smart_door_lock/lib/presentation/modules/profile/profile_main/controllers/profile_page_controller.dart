import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  RxBool isPatternLockEnabled = false.obs;
  RxBool isFaceIdEnabled = false.obs;
  RxBool isPinEnabled = false.obs;
  RxString selectedMode = 'Light'.obs;
  RxString selectedLanguage = 'English'.obs;

  void togglePatternLock(bool value) {
    isPatternLockEnabled.value = value;
  }

  void toggleFaceId(bool value) {
    isFaceIdEnabled.value = value;
  }

  void togglePin(bool value) {
    isPinEnabled.value = value;
  }

  void showModeBottomSheet() {
    Get.snackbar(
      '',
      '',
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      messageText: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select Mode",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () => Get.back(), // Close snackbar
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Mode Options
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Light Mode
                GestureDetector(
                  onTap: () {
                    Get.find<ProfilePageController>().selectedMode.value = 'Light';
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Get.find<ProfilePageController>().selectedMode.value == 'Light'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.light_mode,
                            color: Get.find<ProfilePageController>().selectedMode.value == 'Light'
                                ? Colors.white
                                : Colors.black),
                        const SizedBox(height: 8),
                        Text(
                          "Light",
                          style: TextStyle(
                            color: Get.find<ProfilePageController>().selectedMode.value == 'Light'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Dark Mode
                GestureDetector(
                  onTap: () {
                    Get.find<ProfilePageController>().selectedMode.value = 'Dark';
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Get.find<ProfilePageController>().selectedMode.value == 'Dark'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.dark_mode,
                            color: Get.find<ProfilePageController>().selectedMode.value == 'Dark'
                                ? Colors.white
                                : Colors.black),
                        const SizedBox(height: 8),
                        Text(
                          "Dark",
                          style: TextStyle(
                            color: Get.find<ProfilePageController>().selectedMode.value == 'Dark'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // System Mode
                GestureDetector(
                  onTap: () {
                    Get.find<ProfilePageController>().selectedMode.value = 'System';
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Get.find<ProfilePageController>().selectedMode.value == 'System'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.brightness_auto,
                            color: Get.find<ProfilePageController>().selectedMode.value == 'System'
                                ? Colors.white
                                : Colors.black),
                        const SizedBox(height: 8),
                        Text(
                          "System",
                          style: TextStyle(
                            color: Get.find<ProfilePageController>().selectedMode.value == 'System'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }


  void showLanguageBottomSheet() {
    Get.snackbar(
      '',
      '',
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      messageText: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Change Language",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () => Get.back(), // closes snackbar
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Language Options
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.find<ProfilePageController>().selectedLanguage.value = 'English';
                  },
                  child: Container(
                    width: 160,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Get.find<ProfilePageController>().selectedLanguage.value == 'English'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/hindi 3.png', width: 40, height: 40),
                        const SizedBox(height: 4),
                        Text(
                          "English",
                          style: TextStyle(
                            color: Get.find<ProfilePageController>().selectedLanguage.value == 'English'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.find<ProfilePageController>().selectedLanguage.value = 'Hindi';
                  },
                  child: Container(
                    width: 160,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Get.find<ProfilePageController>().selectedLanguage.value == 'Hindi'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/hindi 2.png', width: 40, height: 40),
                        const SizedBox(height: 4),
                        Text(
                          "Hindi",
                          style: TextStyle(
                            color: Get.find<ProfilePageController>().selectedLanguage.value == 'Hindi'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
