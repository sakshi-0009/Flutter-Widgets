import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_us_controller.dart';

class AboutUs extends GetView<AboutUsController> {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: const Center(
        child: Text("About Us"),
      ),
    );
  }
}
