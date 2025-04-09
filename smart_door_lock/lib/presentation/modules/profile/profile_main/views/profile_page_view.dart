import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.logout, color: Color(0xFFE3241E)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Nihant Rathod",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Pune, Maharashtra, India",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.grey),
                    onPressed: () {
                      Get.toNamed('/profile_setting_view');
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.phone, color: Color(0xFF69778A)),
                        SizedBox(width: 8),
                        Text(
                          " 8342342342",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.email, color: Color(0xFF69778A)),
                        SizedBox(width: 8),
                        Text(
                          "nihant@tudip.com",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      "App Setting",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF69778A),
                      ),
                    ),
                  ),

                  //Pattren Lock
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.pattern_outlined, color: Color(0xFF69778A)),
                          SizedBox(width: 12),
                          Text("Require Pattern Lock", style: TextStyle(fontSize: 16, color: Color(0xFF69778A))),
                        ],
                      ),
                      Obx(() => Switch(
                        value: controller.isPatternLockEnabled.value,
                        onChanged: controller.togglePatternLock,
                        activeColor: controller.isPatternLockEnabled.value
                            ? const Color(0xFFE3241E)
                            : Colors.grey,
                      )),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),

                  //Face ID
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.tag_faces, color: Color(0xFF69778A)),
                          SizedBox(width: 12),
                          Text("Require Face ID", style: TextStyle(fontSize: 16, color: Color(0xFF69778A))),
                        ],
                      ),
                      Obx(() => Switch(
                        value: controller.isFaceIdEnabled.value,
                        onChanged: controller.toggleFaceId,
                        activeColor: controller.isFaceIdEnabled.value
                            ? const Color(0xFFE3241E)
                            : Colors.grey,
                      )),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),

                  //PIN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.lock_outlined, color: Color(0xFF69778A)),
                          SizedBox(width: 12),
                          Text("Require Pin", style: TextStyle(fontSize: 16, color: Color(0xFF69778A))),
                        ],
                      ),
                      Obx(() => Switch(
                        value: controller.isPinEnabled.value,
                        onChanged: controller.togglePin,
                        activeColor: controller.isPinEnabled.value
                            ? const Color(0xFFE3241E)
                            : Colors.grey,
                      )),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),

                  //Mode
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.light_mode_outlined, color: Color(0xFF69778A)),
                          SizedBox(width: 12),
                          Text("Mode", style: TextStyle(fontSize: 16, color: Color(0xFF69778A))),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Color(0xFF69778A)),
                        onPressed: controller.showModeBottomSheet,
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),

                  //Language
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.language, color: Color(0xFF69778A)),
                          SizedBox(width: 12),
                          Text("Language", style: TextStyle(fontSize: 16, color: Color(0xFF69778A))),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Color(0xFF69778A)),
                        onPressed: controller.showLanguageBottomSheet,
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.cleaning_services_rounded, color: Color(0xFF69778A)),
                          SizedBox(width: 12),
                          Text("Clear Cache", style: TextStyle(fontSize: 16, color: Color(0xFF69778A))),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle clear cache logic
                        },
                        child: Text(
                          "60 MB",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.notifications_active, color: Color(0xFF69778A)),
                          SizedBox(width: 12),
                          Text("System Notification", style: TextStyle(fontSize: 16, color: Color(0xFF69778A))),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Color(0xFF69778A)),
                        onPressed: () {
                          Get.toNamed('/system_notification_view',);
                        },
                      ),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      "About",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF69778A),
                      ),
                    ),
                  ),
                  buildAboutRow(Icons.info, "About Us", '/about_us'),
                  buildAboutRow(Icons.subscriptions, "Subscription", '/subscription_view'),
                  buildAboutRow(Icons.history, "Video History", '/video_history'),
                  buildAboutRow(Icons.share, "Share the App", '/share_app'),
                  buildAboutRow(Icons.star_rate, "Rate Us", '/rate_us'),
                  buildAboutRow(Icons.speaker_notes_rounded, "Terms and Conditions", '/terms_and_conditions'),
                  buildAboutRow(Icons.privacy_tip, "Privacy Policy", '/privacy_policy', showDivider: false),
                ],
              ),
            ),

            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      "Help and Feedback",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF69778A),
                      ),
                    ),
                  ),
                  buildAboutRow(Icons.question_answer, "Feedback", '/feedback_view'),
                  buildAboutRow(Icons.collections_bookmark_rounded, "User Manual", '/user_manual_view'),
                  buildAboutRow(Icons.question_mark, "FAQ", '/FAQ_view', showDivider: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAboutRow(IconData icon, String label, String route, {bool showDivider = true}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF69778A)),
                const SizedBox(width: 12),
                Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF69778A))),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Color(0xFF69778A)),
              onPressed: () {
                Get.toNamed(route);
              },
            ),
          ],
        ),
        if (showDivider) const Divider(color: Colors.grey, thickness: 0.5),
      ],
    );
  }
}
