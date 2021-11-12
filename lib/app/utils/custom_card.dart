// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final String? cardName;
  final String? cardSubTitile;
  final Function()? onPress;

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
        title: Text(cardName!),
        subtitle: Text(cardSubTitile!),
        trailing: IconButton(
          onPressed: onPress,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
