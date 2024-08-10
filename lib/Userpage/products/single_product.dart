import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/cart/CartPage.dart';
import 'package:shopping1_app/Userpage/products/ProductOverview.dart';
import 'package:shopping1_app/Userpage/payment/wishlist.dart';
import 'package:shopping1_app/provider/product_provider.dart';
import 'package:shopping1_app/Userpage/cart/count.dart';

class SingleProducts extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final int productQuantity;
  final Function onTap;
  final String productId;

  SingleProducts(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.onTap,
      required this.productId,
      required this.productQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductOverview(
                  productName: productName,
                  productImage: productImage,
                  productPrice: productPrice,
                  productId: productId,
                  productQuantity: productQuantity,
                ),
              ),
            );
          },
          child: Container(
            height: 200,
            padding: EdgeInsets.all(5),
            width: double.infinity,
            child: Image.network(
              productImage,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  productName,
                  style: TextStyle(
                    color: Color(0xFF4C53A5),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.yellow,
                      ),
                      child: Row(children: [
                        Text(
                          "   \$${productPrice}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      ]),
                    ),
                    Count(
                      productName: productName,
                      productImage: productImage,
                      productPrice: productPrice,
                      productId: productId,
                      productQuantity: productQuantity,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
