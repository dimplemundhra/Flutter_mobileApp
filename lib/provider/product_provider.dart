import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping1_app/model/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
      productQuantity: element.get("productQuantity"),
    );
    search.add(productModel);
  }

  //////homeDressProduct////

  List<ProductModel> homeDressProductList = [];

  fetchhomeDressProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("homeDressProduct").get();

    value.docs.forEach(
      (element) {
        
        productModels(element);

        newList.add(productModel);
      },
    );
    homeDressProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get gethomeDressProductDataList {
    return homeDressProductList;
  }
}
