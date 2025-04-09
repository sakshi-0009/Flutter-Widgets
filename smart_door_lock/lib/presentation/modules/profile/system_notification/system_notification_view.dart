import 'package:europa_lock/presentation/modules/profile/system_notification/system_notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemNotificationView extends GetView<SystemNotificationController> {
  const SystemNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("System Notification"),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildSection(
              title: "Notification",
              rows: [
                buildToggleRow("Home Sharing", controller.isHomeSharing, controller.toggleHomeSharing),
                buildToggleRow("Member Adding and Removing", controller.isMemberAdding, controller.toggleMemberAdding),
              ],
            ),
            const SizedBox(height: 20),
            buildSection(
              title: "System Permission",
              toggleValue: controller.isSystemPermission,
              onToggleChanged: controller.toggleSystemPermission,
              rows: [
                buildToggleRow("Location", controller.isLocation, controller.toggleLocation),
                buildToggleRow("Camera", controller.isCamera, controller.toggleCamera),
                buildToggleRow("Microphone", controller.isMicrophone, controller.toggleMicrophone),
                buildToggleRow("Notification", controller.isNotification, controller.toggleNotification),
                buildToggleRow("WiFi", controller.isWiFi, controller.toggleWiFi, showDivider: false),
              ],
            ),
            const SizedBox(height: 20),
            buildSection(
              title: "On Notification Bar",
              toggleValue: controller.isNotificationBar,
              onToggleChanged: controller.toggleNotificationBar,
              rows: [
                Text("System Lock Screen"),
                Text("Notification Center")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection({
    required String title,
    required List<Widget> rows,
    RxBool? toggleValue,
    Function(bool)? onToggleChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF69778A),
                  ),
                ),
                if (toggleValue != null && onToggleChanged != null)
                  Obx(() => Switch(
                    value: toggleValue.value,
                    onChanged: onToggleChanged,
                    activeColor: toggleValue.value ? const Color(0xFFE3241E) : Colors.grey,
                  )),
              ],
            ),
          ),
          ...rows,
        ],
      ),
    );
  }


  Widget buildToggleRow(String label, RxBool value, Function(bool) onChanged, {bool showDivider = true}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF69778A))),
            Obx(() => Switch(
              value: value.value,
              onChanged: onChanged,
              activeColor: value.value ? const Color(0xFFE3241E) : Colors.grey,
            )),
          ],
        ),
        if (showDivider) const Divider(color: Colors.grey, thickness: 0.5),
      ],
    );
  }

}
