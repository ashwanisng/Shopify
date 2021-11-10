// ignore_for_file: unnecessary_overrides, prefer_typing_uninitialized_variables, iterable_contains_unrelated_type

import 'package:get/get.dart';
import 'package:shopify/app/data/models/cart.dart';
import 'package:shopify/app/data/models/products.dart';
import 'package:shopify/app/services/cart/item_service.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  String? productId;
  String? productName;
  String? productDescription;
  double? productPrice;
  String? productImage;
  RxString choosenSize = "".obs;

  ItemService itemService = Get.find<ItemService>();

  void setSelected(String value) {
    choosenSize.value = value;
  }

  // var items = <CartItem>[].obs;

  // void addToCart(CartItem addProduct) {
  //   items.add(addProduct);
  // }

  @override
  void onInit() {
    var data = Get.arguments;

    productId = data[0];
    productName = data[1];
    productPrice = data[2];
    productImage = data[3];
    productDescription = data[4];

    print(productId);

    super.onInit();
  }

  // addItemToCart(
  //   String imageUrl,
  //   double price,
  //   String productName,
  //   String id,
  // ) {
  //   if (addToCart.containsKey(id)) {
  //     addToCart.update(
  //       id,
  //       (existingItem) {
  //         print(existingItem.productName);
  //         return CartItem(
  //           productName: existingItem.productName,
  //           productImageUrl: existingItem.productImageUrl,
  //           productPrice: existingItem.productPrice,
  //           productId: existingItem.productId,
  //         );
  //       },
  //     );
  //   } else {
  //     addToCart.putIfAbsent(
  //       id,
  //       () => CartItem(
  //         productId: DateTime.now().toString(),
  //         productName: productName,
  //         productPrice: price,
  //         productImageUrl: imageUrl,
  //       ),
  //     );
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
