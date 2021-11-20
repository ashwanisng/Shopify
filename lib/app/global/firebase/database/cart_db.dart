import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartDataBase extends GetxController {
  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('Cart');

  addProductToCart({
    required String productId,
    required String productName,
    required double productPrice,
    required String productImage,
  }) async {
    Map<String, dynamic> cartItems = {
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'productImage': productImage,
    };

    try {
      await cartCollection.add(cartItems);

      Get.snackbar(
        "Success!",
        "Data Uploaded!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        isDismissible: true,
      );
    } catch (e) {
      Get.snackbar(
        "Error!",
        "Please Try Again!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        isDismissible: true,
      );
    }
  }
}
