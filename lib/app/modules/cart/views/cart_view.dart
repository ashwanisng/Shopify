// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/enviroment/env.dart';

import 'package:shopify/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopify/app/modules/product/controllers/product_controller.dart';

// ignore: use_key_in_widget_constructors
class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'My Bag',
            style: TextStyle(
              color: Env.colors.primaryBlack,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.itemService.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Text(
                    controller.itemService.items[index].productName.isEmpty
                        ? 'Product'
                        : controller.itemService.items[index].productName,
                  ),
                  title: Text(
                    '\$${controller.itemService.items[index].productPrice}',
                  ),
                ),
              );
            },
          ),
        ));
  }
}

/**
 *  ListView.builder(
        itemCount: controller.productController.addToCart.length,
        itemBuilder: (context, index) {
          var data = controller.productController.addToCart[index];
          print(data!.productName);
          return Container(
            height: 104,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(data.productImageUrl),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.productName,
                        style: TextStyle(
                          color: Env.colors.primaryBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.productController.choosenSize.value,
                        style: TextStyle(
                          color: Env.colors.primaryBlack,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (controller.totalCollection.value <= 0) {
                                controller.totalCollection.value = 0;
                              } else {
                                controller.totalCollection.value--;
                              }
                            },
                            icon: Icon(
                              CupertinoIcons.minus_circle_fill,
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${controller.totalCollection.value}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.totalCollection.value++;
                            },
                            icon: Icon(
                              CupertinoIcons.add_circled_solid,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                      ),
                      Text(
                        "Rs.${data.productPrice}",
                        style: TextStyle(
                          color: Env.colors.primaryBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
 */