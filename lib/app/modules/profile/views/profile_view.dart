// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';

import 'package:shopify/app/modules/profile/controllers/profile_controller.dart';
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
                        backgroundImage:
                            NetworkImage('https://cdn.shopify.com/s/'),
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
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'My Addresses',
              cardSubTitile: "3 Addresses",
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'Payment Method',
              cardSubTitile: "Visa **34",
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'Promocodes',
              cardSubTitile: "You have special promocodes",
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'My reviews',
              cardSubTitile: "Reviews for 4 items",
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'Settings',
              cardSubTitile: "Theme, notifications",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
