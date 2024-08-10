import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping1_app/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  void addCartData({
    required String cartId,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("CartPage")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourCartPage")
        .doc(cartId)
        .set({
      "cartID": cartId,
      "cartImage": cartImage,
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdd": true,
    });
  }

  ////update////

  void updateCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("CartPage")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourCartPage")
        .doc(cartId)
        .update(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }

  ////Get CartList Data////

  List<CartModel> cartDataList = [];

  getCartData() async {
    List<CartModel> newList = [];
    QuerySnapshot cartValue = await FirebaseFirestore.instance
        .collection("CartPage")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourCartPage")
        .get();
    for (var element in cartValue.docs) {
      CartModel cartModel = CartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      );
      newList.add(cartModel);
      
    }
    cartDataList = newList;
    notifyListeners();
  }

  List<CartModel> get getCartDataList {
    return cartDataList;
  }

////////CartDelete//////

  CartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("CartPage")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourCartPage")
        .doc(cartId)
        .delete();
    notifyListeners();
  }

//// TotalPrice  ///

  getTotalPrice() {
    double total = 0.0;
    for (var element in cartDataList) {
      total += element.cartPrice * element.cartQuantity;
    }
    return total;
  }
}
