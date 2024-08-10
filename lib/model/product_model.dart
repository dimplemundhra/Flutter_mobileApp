//import 'package:flutter/material.dart';

class ProductModel {
  final String productId;
  final String productName;
  final String productImage;
  final int productPrice;
  final int productQuantity;

  ProductModel(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productId});
}
