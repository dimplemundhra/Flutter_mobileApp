import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/cart/CartPage.dart';
import 'package:shopping1_app/provider/cart_provider.dart';

class Count extends StatefulWidget {
  late String productName;
  late String productImage;
  late int productPrice;
  late String productId;
  late int productQuantity;

  Count({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("CartPage")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourCartPage")
        .doc(widget.productId)
        .get()
        .then(
      (value) {
        if (this.mounted) {
          if (value.exists) {
            final cartQuantity = value.get("cartQuantity");
            if (cartQuantity != null) {
              setState(() {
                count = cartQuantity
                    as int; // Assign the value only if it's not null
              });
            } else {
              // Handle the case where cartQuantity is null
              //You can set a default value or show an error message
              setState(() {
                count = 1; // Default value
              });
            }
            final isAdd = value.get("isAdd");
            if (isAdd != null) {
              setState(() {
                isTrue =
                    isAdd as bool; // Assign the value only if it's not null
              });
            } else {
              // Handle the case where isAdd is null
              // You can set a default value or show an error message
              setState(() {
                isTrue = false; // Default value
              });
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();

    CartProvider cartPageProvider = Provider.of(context);
    return Container(
      height: 32,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.yellow),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                      cartPageProvider.updateCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                      );
                    }
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      cartPageProvider.CartDataDelete(widget.productId);
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    color: Color.fromARGB(255, 95, 104, 196),
                    size: 15,
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                    color: Color.fromARGB(255, 95, 104, 196),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    cartPageProvider.updateCartData(
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartName: widget.productName,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 95, 104, 196),
                    size: 15,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => CartPage(),
                  //   ),
                  // );
                  setState(() {
                    isTrue = true;
                  });
                  cartPageProvider.addCartData(
                    cartId: widget.productId,
                    cartImage: widget.productImage,
                    cartName: widget.productName,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                  );
                },
                child: Icon(
                  CupertinoIcons.cart_fill,
                  color: Color.fromARGB(255, 95, 104, 196),
                  size: 20,
                ),
              ),
            ),
    );
  }
}
