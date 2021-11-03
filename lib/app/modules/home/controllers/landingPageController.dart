// ignore_for_file: file_names, unnecessary_overrides

import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var slectedIndex = 0.obs;

  void changeIndex(int index) {
    slectedIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
