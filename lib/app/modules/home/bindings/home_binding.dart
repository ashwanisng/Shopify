import 'package:get/get.dart';
import 'package:shopify/app/controller/wishlist_functionality.dart';

import 'package:shopify/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<WishlistFunctionality>(
      () => WishlistFunctionality(),
    );
  }
}
