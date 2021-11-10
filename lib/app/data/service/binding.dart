import 'package:get/get.dart';
import 'package:shopify/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopify/app/modules/home/controllers/home_controller.dart';
import 'package:shopify/app/modules/product/controllers/product_controller.dart';
import 'package:shopify/app/services/cart/item_service.dart';

class AllBinding extends Bindings {
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
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ItemService>(
      () => ItemService(),
    );
  }
}
