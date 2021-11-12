import 'package:get/get.dart';
import 'package:shopify/app/controller/wishlist_functionality.dart';

import 'package:shopify/app/modules/wishlist/controllers/wishlist_controller.dart';

class WishlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
      fenix: true,
    );

    // Get.lazyPut<WishlistFunctionality>(
    //   () => WishlistFunctionality(),
    //   fenix: true,
    // );
  }
}
