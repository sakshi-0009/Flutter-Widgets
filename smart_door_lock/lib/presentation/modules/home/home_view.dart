import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Center(child: Text("Home Page")),
      const Center(child: Text("Profile Page")),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        backgroundColor: const Color(0xFFE3241E),
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        items: [
          BottomNavigationBarItem(
            icon: controller.selectedIndex.value == 0
                ? const SizedBox.shrink()
                : const Icon(Icons.home_filled),
            label: controller.selectedIndex.value == 0 ? 'Home' : '',
          ),
          BottomNavigationBarItem(
            icon: controller.selectedIndex.value == 1
                ? const SizedBox.shrink()
                : const Icon(Icons.account_circle),
            label: controller.selectedIndex.value == 1 ? 'Profile' : '',
          ),
        ],
      )),
    );
  }
}
