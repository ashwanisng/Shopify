// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopify/app/core/enviroment/env.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  Function() onPressed;

  CustomButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 343,
        height: 48,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Env.colors.primaryWhite,
              letterSpacing: 2,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Env.colors.primaryRed,
            borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
