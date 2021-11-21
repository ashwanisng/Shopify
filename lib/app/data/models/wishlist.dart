class WishList {
  String? productId;
  String? productName;
  String? productImage;
  double? productPrice;
  String? productDescription;
  bool isFavourite;

  WishList({
    this.productName,
    this.productImage,
    this.productPrice,
    this.productId,
    this.productDescription,
    this.isFavourite = true,
  });
}
