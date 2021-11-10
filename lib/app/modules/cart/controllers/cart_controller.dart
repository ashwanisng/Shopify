// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shopify/app/services/cart/item_service.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  var totalCollection = 0.obs;

  // ProductController productController = Get.find<ProductController>();

  ItemService itemService = Get.find<ItemService>();
  @override
  void onInit() {
    for (var i = 0; i < itemService.items.length; i++) {
      print(itemService.items[i].productName);
    }
    var res = itemService.items.length;
    print('lenght is $res');

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
