// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/app/controller/wishlist_functionality.dart';
import 'package:shopify/app/data/models/products.dart';
import 'package:shopify/app/global/firebase/database/db.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  GlobalKey<RefreshIndicatorState> indicator =
      GlobalKey<RefreshIndicatorState>();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('productData');

  // Database db = Get.find<Database>();

  var items = [];

  // List items = [];

  int currentPos = 0;
  List<String> listPaths = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg",
  ];

  fetchProductsFromTheDatabase() async {
    QuerySnapshot querySnapshot = await collectionReference.get();

    items =
        querySnapshot.docs.map((DocumentSnapshot doc) => doc.data()).toList();
  }

  Future refreshProducts() {
    return fetchProductsFromTheDatabase();
  }

  WishlistFunctionality wishlistFunctionality =
      Get.find<WishlistFunctionality>();

  @override
  void onInit() {
    fetchProductsFromTheDatabase();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchProductsFromTheDatabase();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
