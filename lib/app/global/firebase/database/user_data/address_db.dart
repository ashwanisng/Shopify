import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDatabase extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference addressCollection =
      FirebaseFirestore.instance.collection('address');

  var addressList = [];

  addUserAddress({
    required String? address,
    required String? city,
    required String? country,
    required String? fullName,
    required String? state,
    required int? zip,
  }) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;

    Map<String, dynamic> data = {
      'address': address,
      'city': city,
      'country': country,
      'fullName': fullName,
      'state': state,
      'zip': zip,
    };

    try {
      await addressCollection.doc(uid).collection("address").add(data);

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

  fetchUserAddress() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;

    try {
      var snapshot =
          await addressCollection.doc(uid).collection("address").get();
      addressList = snapshot.docs.map((doc) => doc.data()).toList();
      update();
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
