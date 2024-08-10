import 'package:flutter/material.dart';

class radioBill extends StatelessWidget {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {},
              ),
              SizedBox(
                width: 2,
              ),
              Text("17/12 panitanki road"),
            ],
          ),
          /* Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {},
              ),
              SizedBox(
                width: 2,
              ),
              Text("19/2 OriyaPara Lane"),
            ],
          ),*/
        ],
      ),
    );
  }
}
