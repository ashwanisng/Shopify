import 'package:get/get.dart';
import 'package:shopify/app/modules/cart/controllers/cart_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
      fenix: true,
    );
  }
}
