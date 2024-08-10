import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping1_app/model/product_model.dart';

class WishListProvider with ChangeNotifier {
  addWishData({
    required String wishId,
    required String wishImage,
    required String wishName,
    required int wishPrice,
    required int wishListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishId)
        .set(
      {
        "wishID": wishId,
        "wishImage": wishImage,
        "wishName": wishName,
        "wishPrice": wishPrice,
        " wishListQuantity":wishListQuantity,
        "wishlist": true,
        
      },
    );
  }

//////Get WishList Data//////

  List<ProductModel> wishList = [];

  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach(
      (element) {
        ProductModel productModel = ProductModel(
          productImage: element.get("wishImage"),
          productName: element.get("wishName"),
          productPrice: element.get("wishPrice"),
          productQuantity: element.get("wishListQuantity"),
          productId: element.get("wishId"),
        );
        newList.add(productModel);
      },
    );
    wishList = newList;
    notifyListeners();
  }

  List <ProductModel> get getWishList {
    return wishList;
  }
}
