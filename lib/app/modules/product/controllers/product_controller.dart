// ignore_for_file: unnecessary_overrides, prefer_typing_uninitialized_variables, iterable_contains_unrelated_type

import 'package:get/get.dart';

import 'package:shopify/app/controller/cart_functionality.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  String? productId;
  String? productName;
  dynamic productPrice;
  String? productImage;
  String? productDescription;

  RxString choosenSize = "".obs;

  var isFavorite = false.obs;

  CartFunctionalityController itemService =
      Get.find<CartFunctionalityController>();

  void setSelected(String value) {
    choosenSize.value = value;
  }

  @override
  void onInit() {
    var data = Get.arguments;

    print(data['isFavourite']);
    productId = data["productId"];
    productName = data["productName"];
    productPrice = data["productPrice"];
    productImage = data["productImage"];
    productDescription = data["productDescription"];
    isFavorite = data["isFavourite"];

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
