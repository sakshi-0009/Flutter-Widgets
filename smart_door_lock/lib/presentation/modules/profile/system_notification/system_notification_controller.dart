import 'package:get/get.dart';

class SystemNotificationController extends GetxController {
  RxBool isHomeSharing = false.obs;
  RxBool isMemberAdding = false.obs;
  RxBool isSystemPermission = false.obs;
  RxBool isLocation = false.obs;
  RxBool isWiFi = false.obs;
  RxBool isCamera = false.obs;
  RxBool isMicrophone = false.obs;
  RxBool isNotification = false.obs;
  RxBool isNotificationBar = false.obs;

  void toggleHomeSharing(bool value) {
    isHomeSharing.value = value;
  }

  void toggleMemberAdding(bool value) {
    isMemberAdding.value = value;
  }

  void toggleSystemPermission(bool value) {
    isSystemPermission.value = value;
  }

  void toggleLocation(bool value) {
    isLocation.value = value;
  }

  void toggleWiFi(bool value) {
    isWiFi.value = value;
  }

  void toggleCamera(bool value) {
    isCamera.value = value;
  }

  void toggleMicrophone(bool value) {
    isMicrophone.value = value;
  }

  void toggleNotification(bool value) {
    isNotification.value = value;
  }

  void toggleNotificationBar(bool value) {
    isNotificationBar.value = value;
  }
}
