import 'package:get/get.dart';
import 'package:shopify/app/controller/wishlist_functionality.dart';
import 'package:shopify/app/global/firebase/auth/auth.dart';
import 'package:shopify/app/global/firebase/database/cart_db.dart';
import 'package:shopify/app/global/firebase/database/db.dart';
import 'package:shopify/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopify/app/modules/category/controllers/category_controller.dart';
import 'package:shopify/app/modules/entry/controllers/entry_controller.dart';
import 'package:shopify/app/modules/home/controllers/home_controller.dart';
import 'package:shopify/app/modules/login/controllers/login_controller.dart';
import 'package:shopify/app/modules/product/controllers/product_controller.dart';
import 'package:shopify/app/controller/cart_functionality.dart';
import 'package:shopify/app/modules/profile/controllers/profile_controller.dart';
import 'package:shopify/app/modules/profile/controllers/setting_controller.dart';
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
      fenix: true,
    );
    Get.lazyPut<CartFunctionalityController>(
      () => CartFunctionalityController(),
      fenix: true,
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
      fenix: true,
    );
    Get.lazyPut<SignupController>(
      () => SignupController(),
      fenix: true,
    );
    Get.lazyPut<FirebaseAuthService>(
      () => FirebaseAuthService(),
      fenix: true,
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true,
    );
    Get.lazyPut<SettingController>(
      () => SettingController(),
      fenix: true,
    );

    Get.lazyPut<EntryController>(
      () => EntryController(),
      fenix: true,
    );

    Get.lazyPut<CategoryController>(
      () => CategoryController(),
      fenix: true,
    );

    Get.lazyPut<Database>(
      () => Database(),
      fenix: true,
    );
    Get.lazyPut<CartDataBase>(
      () => CartDataBase(),
      fenix: true,
    );
  }
}
