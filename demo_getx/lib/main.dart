import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CounterController extends GetxController{
  var count = 0.obs;
  void increment(){
    count++;
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        // Using Obx to update the title dynamically
        title: Obx(() => Text(
          "Counter: ${controller.count}", // Display current count
          style: TextStyle(fontSize: 30),
        )),
        backgroundColor: Color(0xFF1FAA5F),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(About()),
          child: Text("Total Count", style: TextStyle(fontSize: 30),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("Total Count", style: TextStyle(fontSize: 30)),
      ),
      body: Center(
        child: Text("Current count: ${controller.count}", style: TextStyle(fontSize: 30)),
      ),
    );
  }

}