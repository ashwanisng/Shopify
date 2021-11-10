// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/data/models/cart.dart';
import 'package:shopify/app/data/models/products.dart';
import 'package:shopify/app/enviroment/env.dart';

import 'package:shopify/app/modules/product/controllers/product_controller.dart';
import 'package:shopify/app/services/cart/item_service.dart';
import 'package:shopify/app/utils/custom_button.dart';

// ignore: use_key_in_widget_constructors
class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.background,
      appBar: AppBar(
        title: Text(
          controller.productName!,
          style: TextStyle(
            color: Env.colors.primaryBlack,
            fontSize: 34,
            fontFamily: "Roboto",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Env.colors.primaryBlack,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.shopping_cart,
              color: Env.colors.primaryBlack,
            ),
            onPressed: () => Get.toNamed('/cart'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Image.network(
                controller.productImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 60,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButton<String>(
                      value: controller.choosenSize.value.isNotEmpty
                          ? controller.choosenSize.value
                          : null,
                      key: UniqueKey(),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Env.colors.primaryBlack,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Env.colors.primaryBlack),
                      items: <String>['XS', 'S', 'M', 'L', 'XL']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (dynamic newValue) {
                        controller.setSelected(newValue);
                      },
                      hint: Text(
                        'Size',
                        style: TextStyle(
                          color: Env.colors.primaryBlack,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.heart,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    controller.productName!,
                    style: Env.textStyles.headline,
                  ),
                ),
                Container(
                  child: Text(
                    "Price : ${controller.productPrice!.toString()}",
                    style: Env.textStyles.headline3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Text(
                controller.productDescription!,
                style: Env.textStyles.text,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              buttonText: "ADD TO CART",
              onPressed: () {
                controller.itemService.addToCart(
                  context,
                  CartItem(
                    productId: controller.productId!,
                    productImageUrl: controller.productImage!,
                    productName: controller.productName!,
                    productPrice: controller.productPrice!,
                  ),
                );

                print("printingggggggggggggg");
              },
            ),
          ),
        ],
      ),
    );
  }
}
