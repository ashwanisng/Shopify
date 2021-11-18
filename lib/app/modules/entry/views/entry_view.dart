import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shopify/app/modules/entry/controllers/entry_controller.dart';
import 'package:shopify/app/modules/signup/views/signup_view.dart';

class EntryView extends GetView<EntryController> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(SignupView());
    });

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF67C21),
                Color(0xFFFBB034),
                Color(0xFFF89D29),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Shopify",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: "Robto",
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
