// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/enviroment/env.dart';

import 'package:shopify/app/modules/cart/controllers/cart_controller.dart';

// ignore: use_key_in_widget_constructors
class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'My Bag',
          style: TextStyle(
            color: Env.colors.primaryBlack,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        // centerTitle: true,
        backgroundColor: Env.colors.primaryCartScreenBackgroundColor,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.itemService.items.length,
          itemBuilder: (context, index) {
            var data = controller.itemService.items[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 140,
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Env.colors.primaryWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // height: 100,
                        width: 120,
                        child: Image.network(
                          data.productImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                            data.productSize,
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
                                  color: Env.colors.primaryGray,
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
                                  color: Env.colors.primaryGray,
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
                            icon: Icon(
                              Icons.more_vert,
                              color: Env.colors.primaryGray,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Rs.${data.productPrice}",
                              style: TextStyle(
                                color: Env.colors.primaryBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
