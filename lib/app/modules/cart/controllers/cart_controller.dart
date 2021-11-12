// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shopify/app/controller/cart_functionality.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  var totalCollection = 0.obs;

  CartFunctionalityController itemService =
      Get.find<CartFunctionalityController>();
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
