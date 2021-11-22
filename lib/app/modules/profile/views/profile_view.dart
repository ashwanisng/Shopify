// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';

import 'package:shopify/app/modules/profile/controllers/profile_controller.dart';
import 'package:shopify/app/modules/profile/views/component/address.dart';
import 'package:shopify/app/modules/profile/views/component/settings.dart';
import 'package:shopify/app/utils/custom_card.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.primaryWhite,
      appBar: AppBar(
        title: Text(
          'My Profile',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Ashwani Kumar Singh',
                            style: Env.textStyles.headline3,
                          ),
                          Text(
                            'ashwanicena5@gmail.com',
                            style: Env.textStyles.subheads,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomCardView(
              cardName: "My Orders",
              cardSubTitile: "Already have 12 orders",
              icon: Icons.arrow_forward_ios,
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'My Addresses',
              cardSubTitile: "3 Addresses",
              icon: Icons.arrow_forward_ios,
              onPress: () {
                Get.to(() => AddressView());
              },
            ),
            CustomCardView(
              cardName: 'Payment Method',
              cardSubTitile: "Visa **34",
              icon: Icons.arrow_forward_ios,
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'Promocodes',
              cardSubTitile: "You have special promocodes",
              icon: Icons.arrow_forward_ios,
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'My reviews',
              cardSubTitile: "Reviews for 4 items",
              icon: Icons.arrow_forward_ios,
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'Settings',
              cardSubTitile: "Theme, notifications",
              icon: Icons.arrow_forward_ios,
              onPress: () {
                Get.offAll(Settings());
                // controller.auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
