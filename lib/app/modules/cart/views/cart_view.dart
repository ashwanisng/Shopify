// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';

import 'package:shopify/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopify/app/utils/custom_button.dart';

// ignore: use_key_in_widget_constructors
class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.primaryWhite,
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(
            color: Env.colors.primaryBlack,
            fontSize: 34,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Env.colors.primaryWhite,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: controller.itemService.items.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
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
                                          if (controller
                                                  .totalCollection.value <=
                                              0) {
                                            controller.totalCollection.value =
                                                0;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Total",
                      style: TextStyle(
                        color: Env.colors.primaryBlack,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Rs. 540",
                      style: TextStyle(
                        color: Env.colors.primaryBlack,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(buttonText: "CHECK OUT", onPressed: () {}),
        ],
      ),
    );
  }
}
