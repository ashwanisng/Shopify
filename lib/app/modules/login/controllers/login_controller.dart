// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopify/app/global/firebase/auth/auth.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emailController =
      TextEditingController(text: "test@test.com");
  TextEditingController passwordController =
      TextEditingController(text: "test@12345");

  FirebaseAuthService authService = Get.find<FirebaseAuthService>();

  RxBool isVisible = true.obs;

  void tooglePassword() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
