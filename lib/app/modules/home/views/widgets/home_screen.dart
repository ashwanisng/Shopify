// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';
import 'package:shopify/app/data/models/wishlist.dart';
import 'package:shopify/app/modules/home/controllers/home_controller.dart';

class HomeScreenView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopify',
          style: TextStyle(
            color: Env.colors.primaryRed,
            fontSize: 34,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Env.colors.primaryGray,
            ),
            onPressed: () {}),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                itemCount: controller.listPaths.length,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return MyImageView(controller.listPaths[itemIndex]);
                },
                options: CarouselOptions(
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    controller.currentPos = index;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.listPaths.map(
                  (e) {
                    int index = controller.listPaths.indexOf(e);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentPos == index
                            ? Color(0xFF00BFA5)
                            : Color(0xFF00BFA5).withOpacity(0.4),
                      ),
                    );
                  },
                ).toList(),
              )
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "New",
              style: Env.textStyles.headline,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: controller.items.map(
                (e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/product',
                              arguments: [
                                e.id,
                                e.name,
                                e.price,
                                e.imageUrl,
                                e.description,
                              ],
                            );
                          },
                          child: Container(
                            child: Image.network(
                              e.imageUrl,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 110,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                child: Text(
                                  e.name,
                                  style: Env.textStyles.headline3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                e.isFavorite.value == true
                                    ? e.isFavorite.value = false
                                    : e.isFavorite.value = true;

                                if (e.isFavorite.isTrue) {
                                  controller.wishlistFunctionality
                                      .addProductToWishlist(
                                    context,
                                    WishList(
                                      productName: e.name,
                                      productId: e.id,
                                      productPrice: e.price,
                                      productImage: e.imageUrl,
                                      isFavourite: e.isFavorite.value,
                                    ),
                                  );
                                } else {
                                  if (controller.wishlistFunctionality.products
                                      .isNotEmpty) {
                                    controller.wishlistFunctionality
                                        .removeProductFromWishlist(
                                      context,
                                      WishList(
                                        productName: e.name,
                                        productId: e.id,
                                        productPrice: e.price,
                                        productImage: e.imageUrl,
                                        isFavourite: e.isFavorite.value,
                                      ),
                                    );
                                  }
                                }
                              },
                              icon: Obx(
                                () => e.isFavorite.value == true
                                    ? Icon(
                                        CupertinoIcons.heart_fill,
                                        color: Colors.red,
                                        size: 32,
                                      )
                                    : Icon(CupertinoIcons.heart),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            "Price : ${e.price}",
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyImageView extends StatelessWidget {
  String path;
  MyImageView(this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
    );
  }
}
