// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/controller/wishlist_functionality.dart';
import 'package:shopify/app/core/enviroment/env.dart';
import 'package:shopify/app/data/models/wishlist.dart';

import 'package:shopify/app/modules/wishlist/controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 8) / 2.8;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist View'),
        centerTitle: true,
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),

            // crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            var data = controller.wishlistFunctionality.products[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.network(
                      data.productImage!,
                      fit: BoxFit.fitWidth,
                      height: 150,
                      width: 200,
                    ),
                    Positioned(
                      top: 0,
                      bottom: 214,
                      left: 132,
                      right: 0,
                      child: Container(
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                          color: Env.colors.primaryWhite,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            print(index);
                            controller.wishlistFunctionality
                                .removeProductFromWishlist(
                              context,
                              index,
                            );

                            data.isFavourite = false;

                            Get.snackbar(
                              "Item Removed",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Env.colors.primaryBlack,
                              colorText: Env.colors.primaryWhite,
                              dismissDirection:
                                  SnackDismissDirection.HORIZONTAL,
                            );
                          },
                          icon: Icon(
                            Icons.close,
                            color: Env.colors.primaryRed,
                            // size: 30,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 128,
                      bottom: 80,
                      left: 125,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Env.colors.primaryRed,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.bag_fill,
                            color: Env.colors.primaryWhite,
                            // size: 30,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // height: 30,
                      // width: 90,
                      margin: EdgeInsets.only(top: 152, left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 8, 0, 2),
                            child: Text(
                              data.productName!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 2),
                            child: Row(
                              children: [
                                Text(
                                  'Price: ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                Text(
                                  '\$${data.productPrice}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: controller.wishlistFunctionality.products.length,
        ),
      ),
    );
  }
}

/**
 * Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        data.productImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.bag,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              data.productName!,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '\$${data.productPrice}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
 */