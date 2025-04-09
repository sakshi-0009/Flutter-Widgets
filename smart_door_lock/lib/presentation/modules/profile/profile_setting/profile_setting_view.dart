import 'package:europa_lock/presentation/modules/profile/profile_setting/profile_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            // Circular Profile Container
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12, // You can show profile image here
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: controller.showAddPhotoSheet,
                    child: const Text(
                      "Add photo",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
