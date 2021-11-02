// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'package:shopify/app/modules/cart/bindings/cart_binding.dart';
import 'package:shopify/app/modules/cart/views/cart_view.dart';
import 'package:shopify/app/modules/category/bindings/category_binding.dart';
import 'package:shopify/app/modules/category/views/category_view.dart';
import 'package:shopify/app/modules/home/bindings/home_binding.dart';
import 'package:shopify/app/modules/home/views/home_view.dart';
import 'package:shopify/app/modules/profile/bindings/profile_binding.dart';
import 'package:shopify/app/modules/profile/views/profile_view.dart';
import 'package:shopify/app/modules/wishlist/bindings/wishlist_binding.dart';
import 'package:shopify/app/modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

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
  ];
}
