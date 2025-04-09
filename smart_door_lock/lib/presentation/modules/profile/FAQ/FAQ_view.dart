import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'FAQ_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQs"),
      ),
      body: const Center(
        child: Text("FAQs"),
      ),
    );
  }
}
