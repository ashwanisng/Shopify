// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';

import 'package:shopify/app/modules/signup/controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: Env.textStyles.subheads,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            "Register Account",
            style: Env.textStyles.headline3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
