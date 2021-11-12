// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shopify/app/core/enviroment/env.dart';

class CustomCardView extends StatelessWidget {
  final String? cardName;
  final String? cardSubTitile;
  final Function()? onPress;

  // ignore: prefer_const_constructors_in_immutables
  CustomCardView({
    @required this.cardName,
    @required this.cardSubTitile,
    @required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      child: ListTile(
        title: Text(
          cardName!,
          style: Env.textStyles.descriptiveItem,
        ),
        subtitle: Text(cardSubTitile!),
        trailing: IconButton(
          onPressed: onPress,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
