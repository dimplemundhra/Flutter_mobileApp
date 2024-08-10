import 'package:flutter/material.dart';

class helpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 223, 224, 235),
        padding: EdgeInsets.only(top: 40),
        child: ListView(children: [
          Card(
            color: Color.fromARGB(255, 122, 130, 218),
            child: ListTile(
              title: Text('Contact Us'),
              subtitle: Text('9123677646/824014871'),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(
                Icons.phone_callback,
                size: 30,
              ),
              //contentPadding: EdgeInsets.all(20),
              //enabled: false,
              onTap: () {
                print('onTap Pressed!');
              },
              iconColor: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
