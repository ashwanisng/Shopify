import 'package:get/get.dart';
import 'package:shopify/app/controller/wishlist_functionality.dart';
import 'package:shopify/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopify/app/modules/home/controllers/home_controller.dart';
import 'package:shopify/app/modules/login/controllers/login_controller.dart';
import 'package:shopify/app/modules/product/controllers/product_controller.dart';
import 'package:shopify/app/controller/cart_functionality.dart';
import 'package:shopify/app/modules/signup/controllers/signup_controller.dart';
import 'package:shopify/app/modules/wishlist/controllers/wishlist_controller.dart';

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
    Get.lazyPut<CartFunctionalityController>(
      () => CartFunctionalityController(),
    );
    Get.lazyPut<WishlistFunctionality>(
      () => WishlistFunctionality(),
      fenix: true,
    );
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
      fenix: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
