// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/controller/wishlist_functionality.dart';

import 'package:shopify/app/modules/wishlist/controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist View'),
        centerTitle: true,
      ),
      body: GetBuilder<WishlistFunctionality>(
        init: WishlistFunctionality(),
        builder: (value) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            var data = value.products[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 100,
                child: Column(
                  children: [
                    Image.network(
                      data.productImage!,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: value.products.length,
        ),
      ),
    );
  }
}
