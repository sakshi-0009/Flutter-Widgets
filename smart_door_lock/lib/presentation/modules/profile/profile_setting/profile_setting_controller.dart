import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettingController extends GetxController {

  RxString addPhoto = 'Gallery'.obs;

  void showAddPhotoSheet() {
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
                  "Add photo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () => Get.back(), // closes snackbar
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Gallery / Camera options
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.find<ProfileSettingController>().addPhoto.value = 'Gallery';
                  },
                  child: Container(
                    width: 140,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Get.find<ProfileSettingController>().addPhoto.value == 'Gallery'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.photo),
                        const SizedBox(height: 4),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            color: Get.find<ProfileSettingController>().addPhoto.value == 'Gallery'
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
                    Get.find<ProfileSettingController>().addPhoto.value = 'Camera';
                  },
                  child: Container(
                    width: 140,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Get.find<ProfileSettingController>().addPhoto.value == 'Camera'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt_sharp),
                        const SizedBox(height: 4),
                        Text(
                          "Camera",
                          style: TextStyle(
                            color: Get.find<ProfileSettingController>().addPhoto.value == 'Camera'
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
