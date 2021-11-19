// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shopify/app/modules/category/controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CategoryView'),
          centerTitle: true,
        ),
        body: Container()
        // RefreshIndicator(
        //   key: controller.indicator,
        //   onRefresh: controller.refreshProducts,
        //   child: ListView.builder(
        //     itemCount: controller.items.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         leading: Image.network(
        //           controller.items[index]["productImage"],
        //           width: 50,
        //           height: 50,
        //         ),
        //         title: Text(controller.items[index]['productName']),
        //         subtitle:
        //             Text(controller.items[index]['productPrice'].toString()),
        //       );
        //     },
        //   ),
        // ),
        );
  }
}
