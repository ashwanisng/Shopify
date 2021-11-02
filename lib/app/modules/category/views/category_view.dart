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
      body: Center(
        child: Text(
          'CategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
