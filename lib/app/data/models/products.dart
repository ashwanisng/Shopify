class Products {
  String id;
  String name;
  String description;
  double price;
  String imageUrl;
  bool? isFavorite;

  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite,
  });
}
