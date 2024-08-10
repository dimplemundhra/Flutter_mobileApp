import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/cart/CartPage.dart';
import 'package:shopping1_app/provider/wish_provider.dart';

class productBottomNavBar extends StatefulWidget {
  @override
  State<productBottomNavBar> createState() => _productBottomNavBarState();
}

class _productBottomNavBarState extends State<productBottomNavBar> {
  final firestore = FirebaseFirestore.instance.collection('product');

  @override
  Widget build(BuildContext context) {
     WishListProvider wishListProvider = Provider.of(context);
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton.icon(
            onPressed: () {
              String id = DateTime.now().microsecondsSinceEpoch.toString();
              var nameController;
              firestore
                  .doc(id)
                  .set({
                    'name': nameController.toString(),
                    'id': id,
                  })
                  .then((value) => print("product added"))
                  .catchError((Error) => print("Something is wrong"));
            },
            icon: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              child: Icon(
                CupertinoIcons.cart_badge_plus,
                color: Color(0xFF4C53A5),
              ),
            ),
            label: Text(
              "Add To Cart",
              style: TextStyle(
                color: Color(0xFF4C53A5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Spacer(),
          Container(
            //    style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.yellow),
            //   padding: MaterialStateProperty.all(
            //     EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            //   ),
            //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30))),
            // ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ]),

            child: Icon(
              CupertinoIcons.minus,
              size: 18,
              color: Color.fromARGB(255, 73, 82, 190),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "01",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 73, 82, 190),
              ),
            ),
          ),
          Container(
            //padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Icon(
              CupertinoIcons.plus,
              size: 18,
              color: Color.fromARGB(255, 73, 82, 190),
            ),
          ),
        ]),
      ),
    );
  }
}
