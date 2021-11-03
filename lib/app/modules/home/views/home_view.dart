// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/enviroment/env.dart';
import 'package:shopify/app/modules/cart/views/cart_view.dart';
import 'package:shopify/app/modules/category/views/category_view.dart';
import 'package:shopify/app/modules/home/controllers/landingPageController.dart';

import 'package:shopify/app/modules/home/views/widgets/home_screen.dart';
import 'package:shopify/app/modules/profile/views/profile_view.dart';
import 'package:shopify/app/modules/wishlist/views/wishlist_view.dart';

class HomeView extends StatelessWidget {
  final LandingPageController landingPageController =
      Get.put(LandingPageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => IndexedStack(
            index: landingPageController.slectedIndex.value,
            children: [
              HomeScreenView(),
              CategoryView(),
              CartView(),
              WishlistView(),
              ProfileView(),
            ],
          )),
      bottomNavigationBar: Obx(
        () => Container(
          color: Env.colors.primaryWhite,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Env.colors.primaryWhite,
            selectedItemColor: Env.colors.primaryRed,
            unselectedItemColor: Env.colors.primaryGray,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
            onTap: landingPageController.changeIndex,
            currentIndex: landingPageController.slectedIndex.value,
          ),
        ),
      ),
    );
  }
}
