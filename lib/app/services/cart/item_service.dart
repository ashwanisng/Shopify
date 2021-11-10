import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shopify/app/data/models/cart.dart';

class ItemService extends GetxController {
  var items = <CartItem>[].obs;

  addToCart(BuildContext context, CartItem addProduct) {
    items.add(addProduct);
  }

  removeFromCart(BuildContext context, CartItem removeProduct) {
    items.remove(removeProduct);
  }

  clearCart(BuildContext context) {
    items.clear();
  }
}
