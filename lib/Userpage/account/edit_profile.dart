import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class edit_profile  extends StatelessWidget {
  const edit_profile ({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child:Scaffold(
        appBar:AppBar(),
        body: Column(
          children: [
            SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset("assets/images/profile.jpeg")),
              ),
              


          ]),
        )
      
    );
  }
}