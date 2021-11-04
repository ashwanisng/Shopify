// ignore_for_file: unnecessary_overrides, prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:shopify/app/data/models/cart.dart';
import 'package:shopify/app/data/models/products.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  String? productId;
  String? productName;
  String? productDescription;
  double? productPrice;
  String? productImage;
  RxString choosenSize = "".obs;

  void setSelected(String value) {
    choosenSize.value = value;
  }

  @override
  void onInit() {
    var data = Get.arguments;

    productId = data[0];
    productName = data[1];
    productPrice = data[2];
    productImage = data[3];
    productDescription = data[4];

    for (var i = 0; i < addToCart.length; i++) {
      print(addToCart[i].productName);
    }
    print(addToCart.length);

    super.onInit();
  }

  void addItemToCart(
    String imageUrl,
    double price,
    String productName,
    String id,
  ) {
    addToCart.add(CartItem(
      productId: id,
      productImageUrl: imageUrl,
      productName: productName,
      productPrice: price,
    ));
  }

  var addToCart = <CartItem>[];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
