// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';
import 'package:shopify/app/modules/home/controllers/home_controller.dart';
import 'package:shopify/app/modules/product/views/product_view.dart';

class HomeScreenView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 8) / 2.8;
    final double itemWidth = size.width / 2;

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
              controller.db.items.length.toString(),
              style: Env.textStyles.headline,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),

                // crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                var data = controller.db.items[index];
                var val = data["isFavourite"];
                RxBool fav = RxBool(val);
                // print(fav);
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => ProductView(),
                              arguments: {
                                'productId': data["productId"],
                                'productName': data["productName"],
                                'productPrice': data["productPrice"],
                                'productDescription':
                                    data["productDiscription"],
                                'productImage': data["productImage"],
                                'isFavourite': fav,
                              },
                            );
                          },
                          child: Image.network(
                            data['productImage'],
                            fit: BoxFit.fitWidth,
                            height: 150,
                            width: 200,
                          ),
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
                                fav.value == true
                                    ? fav.value = false
                                    : fav.value = true;

                                if (fav.value == true) {
                                  controller.wishlistDatabase
                                      .addProductToWishlist(
                                    productId: data["productId"],
                                    productName: data["productName"],
                                    productImage: data["productImage"],
                                    productPrice: data["productPrice"],
                                    productDescription:
                                        data["productDiscription"],
                                    isFavourite: fav,
                                  );
                                } else {
                                  controller.wishlistDatabase
                                      .removeProductFromWishlist(
                                    data["productId"],
                                  );
                                }
                              },
                              icon: Obx(
                                () => fav.value == true
                                    ? Icon(
                                        CupertinoIcons.heart_fill,
                                        color: Colors.red,
                                        size: 35,
                                      )
                                    : Icon(CupertinoIcons.heart),
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
                              onPressed: () {
                                controller.cartDataBase.addProductToCart(
                                  productId: data["productId"],
                                  productImage: data["productImage"],
                                  productName: data["productName"],
                                  productPrice: data["productPrice"],
                                );
                              },
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
                                child: Flexible(
                                  child: Text(
                                    data["productName"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      color: Env.colors.primaryBlack,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 2),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Price: ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        data["productPrice"].toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto',
                                          color: Env.colors.primaryRed,
                                        ),
                                      ),
                                    ),
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
              itemCount: controller.db.items.length,
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * 
 * GridView.count(
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
                                e.isFavorite!.value == true
                                    ? e.isFavorite!.value = false
                                    : e.isFavorite!.value = true;

                                if (e.isFavorite!.value == true) {
                                  controller.wishlistFunctionality
                                      .addProductToWishlist(
                                    context,
                                    WishList(
                                      productName: e.name,
                                      productId: e.id,
                                      productPrice: e.price,
                                      productImage: e.imageUrl,
                                      isFavourite: e.isFavorite!.value,
                                    ),
                                  );
                                }
                              },
                              icon: Obx(
                                () => e.isFavorite!.value == true
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
 */
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
