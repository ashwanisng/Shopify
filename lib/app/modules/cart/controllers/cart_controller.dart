// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shopify/app/global/firebase/database/cart_db.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  var totalCollection = 0.obs;

  // CartFunctionalityController itemService =
  //     Get.find<CartFunctionalityController>();

  CartDataBase cartDataBase = Get.find<CartDataBase>();

  @override
  void onInit() {
    super.onInit();
    cartDataBase.getAllCartProducts();
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
