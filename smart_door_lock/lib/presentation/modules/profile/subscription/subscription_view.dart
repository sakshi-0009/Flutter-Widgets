import 'package:europa_lock/presentation/modules/profile/subscription/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscription"),
      ),
      body: const Center(
        child: Text("Subscription"),
      ),
    );
  }
}
