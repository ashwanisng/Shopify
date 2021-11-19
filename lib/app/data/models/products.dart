// ignore_for_file: slash_for_doc_comments

import 'dart:convert';

import 'package:get/get.dart';

class Products {
  String id;
  String name;
  String description;
  double price;
  String imageUrl;
  RxBool? isFavorite;

  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite,
  });

  factory Products.fromMap(Map<String, dynamic> data) {
    return Products(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      price: data['price'],
      imageUrl: data['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));
}
