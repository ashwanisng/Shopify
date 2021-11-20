import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartDataBase extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('Cart');

  List cartList = [];

  var refrence;

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

    final User? user = auth.currentUser;
    final uid = user!.uid;

    try {
      await cartCollection.doc(uid).collection("cartCollection").add(cartItems);

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

  getAllCartProducts() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;

    refrence = FirebaseFirestore.instance
        .collection('Cart')
        .doc(uid)
        .collection("cartCollection")
        .snapshots();

    QuerySnapshot querySnapshot =
        await cartCollection.doc(uid).collection("cartCollection").get();

    cartList =
        querySnapshot.docs.map((DocumentSnapshot doc) => doc.data()).toList();
  }
}
