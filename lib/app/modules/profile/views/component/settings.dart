import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/app/global/firebase/auth/auth.dart';
import 'package:shopify/app/modules/profile/controllers/profile_controller.dart';
import 'package:shopify/app/utils/custom_card.dart';

class Settings extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CustomCardView(
          cardName: 'Sign Out',
          cardSubTitile: '',
          icon: Icons.logout,
          onPress: () {
            controller.auth.signOut();
          },
        ),
      ),
    );
  }
}
