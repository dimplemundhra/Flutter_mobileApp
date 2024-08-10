import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class deliveryitem extends StatelessWidget {
  //const deliveryitem({super.key});
  late final String title;
  late final String address;
  late final String number;
  late final String addressType;
  deliveryitem(
      {required this.title,
      required this.number,
      required this.address,
      required this.addressType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,
                padding: EdgeInsets.all(1),
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFF4C53A5),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  addressType,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )),
              ),
            ],
          ),
          leading: CircleAvatar(radius: 8, backgroundColor: Color(0xFF4C53A5)),
          subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address),
                SizedBox(
                  height: 5,
                ),
                Text(number),
              ]),
        ),
        Divider(
          height: 35,
        )
      ],
    );
  }
}
