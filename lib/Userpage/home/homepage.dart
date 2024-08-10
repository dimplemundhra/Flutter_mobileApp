import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/cart/CartPage.dart';
import 'package:shopping1_app/Userpage/products/ProductOverview.dart';
import 'package:shopping1_app/Userpage/home/searchpage.dart';
import 'package:shopping1_app/provider/product_provider.dart';
import 'package:shopping1_app/widgets/CategoriesWidget.dart';
import 'package:shopping1_app/widgets/HomeAppBar.dart';
import 'package:shopping1_app/Userpage/products/single_product.dart';
import 'package:shopping1_app/Userpage/products/single_product.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late ProductProvider productProvider;
  //FirebaseFirestore firestore = FirebaseFirestore.instance;

  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchhomeDressProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(
      context,
    );
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                    height: 200,
                    //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/happy-couple-with-shopping-bags-posing-white_114579-53998.jpg?w=900&t=st=1683815480~exp=1683816080~hmac=724c90e78fa99f78929e2fa2690a2265c3b902df71046a9f813f29ef22de952e'),
                      ),
                      color: Color(0xFF4C53A5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      right: 130, bottom: 10),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 8, 19, 133),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(60),
                                        bottomLeft: Radius.circular(60),
                                      ),
                                    ),
                                    child: Text(
                                      'Amore Fashion',
                                      style: GoogleFonts.indieFlower(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 245, 232, 232),
                                            shadows: [
                                              BoxShadow(
                                                  color: Colors.yellow,
                                                  blurRadius: 10,
                                                  offset: Offset(3, 3)),
                                            ]),
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  ' 30% off',
                                  style: GoogleFonts.indieFlower(
                                    textStyle: TextStyle(
                                        fontSize: 40,
                                        color: Color.fromARGB(255, 8, 19, 133),
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.yellow,
                                              blurRadius: 10,
                                              spreadRadius: 150,
                                              offset: Offset(3, 3)),
                                        ]),
                                  ),
                                ),
                              ),
                              Text(
                                'on all clothing products',
                                style: GoogleFonts.indieFlower(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 31, 41, 172),
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.yellow,
                                            blurRadius: 10,
                                            offset: Offset(3, 3)),
                                      ]),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: Text(
                    "Catagories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: CategoriesWidget(),
                ),
                //Items
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                //Items Widget
                SingleChildScrollView(
                  child: GridView.count(
                    childAspectRatio: 0.54,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: productProvider.gethomeDressProductDataList.map(
                      (homeDressProductData) {
                        return SingleProducts(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductOverview(
                                  productId: homeDressProductData.productId,
                                  productName: homeDressProductData.productName,
                                  productImage:
                                      homeDressProductData.productImage,
                                  productPrice:
                                      homeDressProductData.productPrice,
                                  productQuantity:
                                      homeDressProductData.productQuantity,
                                ),
                              ),
                            );
                          },
                          productImage: homeDressProductData.productImage,
                          productName: homeDressProductData.productName,
                          productPrice: homeDressProductData.productPrice,
                          productId: homeDressProductData.productId,
                          productQuantity: homeDressProductData.productQuantity,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF4C53A5),
        height: 55,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Badge(
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(7),
            textStyle: TextStyle(
              color: Colors.white,
            ),
            //value: cartprovider.itemCount.toString(),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              child: Icon(
                CupertinoIcons.cart_fill,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Badge(
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(7),
            textStyle: TextStyle(
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "accPage");
              },
              child: Icon(
                CupertinoIcons.person,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
