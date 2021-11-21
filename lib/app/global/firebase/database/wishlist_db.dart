import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistDatabase extends GetxController {
  CollectionReference wishlistCollection =
      FirebaseFirestore.instance.collection('wishlist');

  final FirebaseAuth auth = FirebaseAuth.instance;

  List wishlist = [];

  addProductToWishlist({
    required String productId,
    required String productName,
    required String productImage,
    required double productPrice,
    required String productDescription,
    required RxBool isFavourite,
  }) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;

    try {
      await wishlistCollection.doc(uid).collection("wishlist").add({
        'productId': productId,
        'productName': productName,
        'productImage': productImage,
        'productPrice': productPrice,
        'productDescription': productDescription,
        'isFavourite': isFavourite.value,
      });

      Get.snackbar(
        "Success!",
        "Product added to wishlist!",
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

  removeProductFromWishlist(String productId) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;

    try {
      wishlistCollection.doc(uid).collection("wishlist");

      QuerySnapshot querySnapshot = await wishlistCollection
          .doc(uid)
          .collection("wishlist")
          .where('productId', isEqualTo: productId)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

      Get.snackbar(
        "Success!",
        "Product Removed from wishlist!",
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
