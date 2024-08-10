import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping1_app/Userpage/products/productBottomNavBar.dart';
import 'package:shopping1_app/Userpage/products/productAppBar.dart';

class product_detail extends StatefulWidget {
  late final String prodImage;
  late final String prodName;
  product_detail({required this.prodImage, required this.prodName});

  @override
  State<product_detail> createState() => _product_detailState();
}

class _product_detailState extends State<product_detail> {
  final firestore = FirebaseFirestore.instance.collection('product');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          productAppBar(),
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
                  'https://i.pinimg.com/564x/6f/e7/74/6fe774df2118127997c3a18b5176f525.jpg',
                  width: 300,
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
                              const Expanded(
                                child: Text(
                                  "Comfortable cloth",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 75, 84, 183),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
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
                                  "Rs. 2500",
                                  style: TextStyle(
                                    fontSize: 20,
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
                            "Check-print black n white       Western Dress",
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
                        ),
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
