import 'package:flutter/material.dart';
import 'package:shopping1_app/widgets/catappbar.dart';

class productpage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          catappBar(),
          for (int i = 26; i < 31; i++)
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
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/men/$i.jpeg',
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Winter Cloth",
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
                      "Comfortable cotton Winter wear Jacket",
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
