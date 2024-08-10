import 'package:flutter/material.dart';

class productAppBar extends StatelessWidget {
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
              color: Color.fromARGB(255, 73, 82, 190),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Product Detail",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 73, 82, 190)),
            ),
          ),
          Spacer(),
          Icon(
            Icons.favorite,
            size: 32,
            color: Color.fromARGB(255, 218, 57, 46),
          ),
        ],
      ),
    );
  }
}
