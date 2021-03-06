import 'package:get/get.dart';

import 'package:shopify/app/modules/cart/bindings/cart_binding.dart';
import 'package:shopify/app/modules/cart/views/cart_view.dart';
import 'package:shopify/app/modules/category/bindings/category_binding.dart';
import 'package:shopify/app/modules/category/views/category_view.dart';
import 'package:shopify/app/modules/entry/bindings/entry_binding.dart';
import 'package:shopify/app/modules/entry/views/entry_view.dart';
import 'package:shopify/app/modules/home/bindings/home_binding.dart';
import 'package:shopify/app/modules/home/views/home_view.dart';
import 'package:shopify/app/modules/login/bindings/login_binding.dart';
import 'package:shopify/app/modules/login/views/login_view.dart';
import 'package:shopify/app/modules/product/bindings/product_binding.dart';
import 'package:shopify/app/modules/product/views/product_view.dart';
import 'package:shopify/app/modules/profile/bindings/profile_binding.dart';
import 'package:shopify/app/modules/profile/views/profile_view.dart';
import 'package:shopify/app/modules/signup/bindings/signup_binding.dart';
import 'package:shopify/app/modules/signup/views/signup_view.dart';
import 'package:shopify/app/modules/wishlist/bindings/wishlist_binding.dart';
import 'package:shopify/app/modules/wishlist/views/wishlist_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ENTRY;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ENTRY,
      page: () => EntryView(),
      binding: EntryBinding(),
    ),
  ];
}
