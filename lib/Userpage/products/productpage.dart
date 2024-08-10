import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/home/homepage.dart';
import 'package:shopping1_app/model/product_model.dart';
import 'package:shopping1_app/provider/product_provider.dart';
import 'package:shopping1_app/widgets/catappbar.dart';

class productpage extends StatefulWidget {
late final String prodImage;
late final String prodName;

  @override
  State<productpage> createState() => _productpageState();
}

class _productpageState extends State<productpage> {
  @override
  //late productprovider productProvider;
  void initState() {
    //productprovider productProvider = Provider.of(context, listen: false);
    //productProvider.fatchwomenDressProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //productProvider = Provider.of(context);
    var productProvider;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          catappBar(),
          for (int i = 11; i < 16; i++)
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  productProvider.getwomenDressProductDataList.map(
                    //   (e) {
                    //    // return
                    //   },
                    //   )
                    //   .toList(),
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 73, 82, 190),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Amore Fashion",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "product_detail");
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/images/$i.jpeg',
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Summer Cloth",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF4C53A5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Comfortable cotton summer wear one-piece",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs 1255",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                        Icon(
                          Icons.shopping_cart_checkout,
                          color: Color(0xFF4C53A5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
