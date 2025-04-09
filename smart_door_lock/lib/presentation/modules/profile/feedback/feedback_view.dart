import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
      ),
      body: const Center(
        child: Text("Feedback"),
      ),
    );
  }
}
