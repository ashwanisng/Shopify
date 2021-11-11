class WishList {
  String? productName;
  String? productImage;
  String? productPrice;
  String? productId;
  bool isFavourite;

  WishList({
    this.productName,
    this.productImage,
    this.productPrice,
    this.productId,
    this.isFavourite = true,
  });
}
