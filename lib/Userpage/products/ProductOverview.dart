import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/provider/wish_provider.dart';
import 'package:shopping1_app/Userpage/products/productBottomNavBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  final int productQuantity;

  ProductOverview({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
  });

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool wishListBool = false;

  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                if (this.mounted) {
                  setState(() {
                    wishListBool = element.get("wishlist");
                  });
                }
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    //getWishListBool();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 28, color: Color(0xFF4C53A5)),
        title: Text(
          "Product Detail",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFF4C53A5),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Image.network(
                  widget.productImage,
                  width: 330,
                  height: 300,
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  (widget.productName),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 75, 84, 183),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: IconButton(
                                  icon: wishListBool == false
                                      ? Icon(
                                          Icons.favorite_outline,
                                          color:
                                              Color.fromARGB(255, 221, 86, 76),
                                          size: 30,
                                        )
                                      : Icon(Icons.favorite,
                                          color:
                                              Color.fromARGB(255, 221, 86, 76),
                                          size: 30),
                                  onPressed: () {
                                    setState(() {
                                      wishListBool = !wishListBool;
                                    });
                                    if (wishListBool == false) {
                                      wishListProvider.addWishData(
                                        wishId: widget.productId,
                                        wishImage: widget.productImage,
                                        wishName: widget.productName,
                                        wishPrice: widget.productPrice,
                                        wishListQuantity:
                                            widget.productQuantity,
                                      );
                                    }
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 73, 82, 190),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "\$${widget.productPrice}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 73, 82, 190),
                              ),
                              onRatingUpdate: (index) {},
                            ),
                            Row(
                              children: [],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),

                          //const SizedBox(height: 20),
                          child: Text(
                            "Comfortable Cloths          "
                            "All size available",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromARGB(255, 73, 82, 190),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Quality: Pure Cotton",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 40, 55, 222),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(children: [
                            Text(
                              "Size:",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 40, 55, 222),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 35; i < 41; i++)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      i.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 40, 55, 222),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: productBottomNavBar(),
    );
  }
}
