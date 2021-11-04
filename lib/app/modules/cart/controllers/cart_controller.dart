// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shopify/app/modules/product/controllers/product_controller.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  var totalCollection = 0.obs;

  ProductController productController = Get.find<ProductController>();

  @override
  void onInit() {
    var len = productController.addToCart.map((e) => e.imageUrl);

    print(len);
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
