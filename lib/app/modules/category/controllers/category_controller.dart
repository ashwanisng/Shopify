// ignore_for_file: unnecessary_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/app/data/models/products.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  // Database db = Get.find<Database>();

  @override
  void onInit() {
    super.onInit();

    // fetchProductsFromTheDatabase();

    // onRefresh();

    // for (var i = 0; i < items.length; i++) {
    //   print(items[i]);
    // }
  }

  @override
  void onReady() {
    super.onReady();
    // refreshProducts();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
