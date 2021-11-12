// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';

import 'package:shopify/app/modules/wishlist/controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 8) / 2.8;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Favorites',
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
