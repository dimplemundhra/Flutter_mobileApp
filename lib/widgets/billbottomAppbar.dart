import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class billbottomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: MaterialButton(
            child: Text(
              "Add New Address",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
            height: 50,
            minWidth: 250,
            color: Color(0xFF4C53A5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
          ),
        ),
      ],
      
    );
  }
}
