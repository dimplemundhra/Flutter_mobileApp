import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // for (int i = 1; i < 3; i++)
          Container(
            height: 140,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 73, 82, 190),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "productpage");
                  },
                  child: Image.asset(
                    //use i variable to change pictures in loop
                    "assets/categoires/womencat.png",
                    width: 100,
                    height: 150,
                  ),
                ),
                Container(
                  child: Text(
                    "Women Dresses",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFFEDECF2),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 140,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 73, 82, 190),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "productpage1");
                  },
                  child: Image.asset(
                    //use i variable to change pictures in loop
                    "assets/categoires/mencat.png",
                    width: 100,
                    height: 150,
                  ),
                ),
                Container(
                  child: Text(
                    " Men Dresses",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFFEDECF2),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 140,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 73, 82, 190),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "productpageS2");
                  },
                  child: Image.asset(
                    //use i variable to change pictures in loop
                    "assets/categoires/shoescat.png",
                    width: 100,
                    height: 150,
                  ),
                ),
                Container(
                  child: Text(
                    "  Sneakers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFFEDECF2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 140,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 73, 82, 190),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "productpageb3");
                  },
                  child: Image.asset(
                    "assets/categoires/bagcat.png",
                    width: 100,
                    height: 150,
                  ),
                ),
                Container(
                  child: Text(
                    "  Hand bags",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFFEDECF2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 140,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 73, 82, 190),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "productpagew4");
                  },
                  child: Image.asset(
                    "assets/categoires/watchcat.png",
                    width: 100,
                    height: 150,
                  ),
                ),
                Container(
                  child: Text(
                    "  Watches",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFFEDECF2),
                    ),
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
