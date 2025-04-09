import 'package:europa_lock/presentation/modules/profile/subscription/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettingView extends GetView<SubscriptionController> {
  const ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Settings"),
      ),
      body: const Center(
        child: Text("Profile Settings"),
      ),
    );
  }
}
