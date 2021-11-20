// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Database extends GetxController {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('productData');

  var items = [];

  fetchProductsFromTheDatabase() async {
    QuerySnapshot querySnapshot = await collectionReference.get();

    items =
        querySnapshot.docs.map((DocumentSnapshot doc) => doc.data()).toList();
  }

  Future refreshProducts() {
    return fetchProductsFromTheDatabase();
  }
}
