import 'package:flutter/material.dart';

class accAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Account",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "wishlist");
              },
              child: Icon(
                Icons.favorite,
                size: 30,
                color: Color.fromARGB(255, 196, 24, 12),
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.shopping_cart_checkout,
            size: 30,
            color: Color(0xFF4C53A5),
          )
        ],
      ),
    );
  }
}
