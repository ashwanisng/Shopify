import 'package:get/get.dart';

class Products {
  String id;
  String name;
  String description;
  double price;
  String imageUrl;
  RxBool isFavorite;
  String? size;

  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    this.size,
  });
}
