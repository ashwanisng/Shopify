import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopify/app/data/models/wishlist.dart';

class WishlistFunctionality extends GetxController {
  var products = <WishList>[].obs;

  addProductToWishlist(BuildContext context, WishList product) {
    products.add(product);
  }

  removeProductFromWishlist(BuildContext context, WishList product) {
    products.remove(product);
  }

  clearWishlist(BuildContext context, WishList product) {
    products.clear();
  }
}
