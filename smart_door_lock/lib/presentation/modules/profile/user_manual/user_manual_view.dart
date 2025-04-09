import 'package:europa_lock/presentation/modules/profile/user_manual/user_manual_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManualView extends GetView<UserManualController> {
  const UserManualView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Manual"),
      ),
      body: const Center(
        child: Text("User Manual"),
      ),
    );
  }
}
