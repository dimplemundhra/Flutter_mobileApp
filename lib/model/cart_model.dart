class CartModel {
  final String cartId;
  final String cartImage;
  final String cartName;
  final int cartPrice;
  final int cartQuantity;
  CartModel(
      {required this.cartId,
      required this.cartImage,
      required this.cartName,
      required this.cartPrice,
      required this.cartQuantity});

  get productPrice => null;
}
