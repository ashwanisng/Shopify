import 'package:get/get.dart';

import 'package:shopify/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopify/app/modules/product/controllers/product_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
      fenix: true,
    );

    Get.lazyPut<ProductController>(
      () => ProductController(),
      fenix: true,
    );
  }
}
