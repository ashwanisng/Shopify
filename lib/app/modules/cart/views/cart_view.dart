// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: StreamBuilder(
                stream: controller.cartDataBase.refrence,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final data = snapshot.requireData;

                  return ListView.builder(
                    itemCount: data.size,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      // height: 100,

                                      width: 120,
                                      child: Image.network(
                                        data.docs[index]["productImage"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          data.docs[index]["productName"],
                                          style: TextStyle(
                                            color: Env.colors.primaryBlack,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "XL",
                                          style: TextStyle(
                                            color: Env.colors.primaryBlack,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                if (controller.totalCollection
                                                        .value <=
                                                    0) {
                                                  controller.totalCollection
                                                      .value = 0;
                                                } else {
                                                  controller
                                                      .totalCollection.value--;
                                                }
                                              },
                                              icon: Icon(
                                                CupertinoIcons
                                                    .minus_circle_fill,
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
                                                controller
                                                    .totalCollection.value++;
                                              },
                                              icon: Icon(
                                                CupertinoIcons
                                                    .add_circled_solid,
                                                color: Env.colors.primaryGray,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: Env.colors.primaryGray,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: RichText(
                                              text: TextSpan(
                                                text:
                                                    "Rs.${data.docs[index]["productPrice"].toString()}",
                                                style: TextStyle(
                                                  color: Env.colors.primaryRed,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
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

/**
 * 
 */