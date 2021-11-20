// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/app/controller/wishlist_functionality.dart';
import 'package:shopify/app/data/models/products.dart';
import 'package:shopify/app/global/firebase/database/cart_db.dart';
import 'package:shopify/app/global/firebase/database/db.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  GlobalKey<RefreshIndicatorState> indicator =
      GlobalKey<RefreshIndicatorState>();

  WishlistFunctionality wishlistFunctionality =
      Get.find<WishlistFunctionality>();

  Database db = Get.find<Database>();

  CartDataBase cartDataBase = Get.find<CartDataBase>();

  int currentPos = 0;
  List<String> listPaths = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg",
  ];

  @override
  void onInit() {
    db.fetchProductsFromTheDatabase();
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
