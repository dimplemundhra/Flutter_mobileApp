import 'package:flutter/material.dart';
import 'package:shopping1_app/Userpage/delivery/deliveryDetails.dart';
import 'package:shopping1_app/widgets/WishAppBar.dart';
import 'package:shopping1_app/Userpage/account/accAppBar.dart';

class accPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 223, 224, 235),
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            accAppBar(),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Card(
                color: Color.fromARGB(255, 122, 130, 218),
                child: ListTile(
                  title: Text('Profile'),
                  subtitle: Text('Manage your Profile info'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(
                    Icons.account_circle_rounded,
                    size: 30,
                  ),
                  //contentPadding: EdgeInsets.all(20),
                  //enabled: false,
                  onTap: () {
                    print('onTap Pressed!');
                    Navigator.pushNamed(context, "profilePage");
                  },
                  iconColor: Color.fromARGB(255, 234, 212, 212),
                  textColor: Color.fromARGB(255, 234, 212, 212),
                ),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 122, 130, 218),
              child: ListTile(
                title: Text('Help and Support'),
                subtitle: Text('Get help for your account'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.help_center_sharp,
                  size: 30,
                ),
                //contentPadding: EdgeInsets.all(20),
                //enabled: false,
                onTap: () {
                  print('onTap Pressed!');
                  Navigator.pushNamed(context, "helpPage");
                },
                iconColor: Color.fromARGB(255, 234, 212, 212),
                textColor: Color.fromARGB(255, 234, 212, 212),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 122, 130, 218),
              child: ListTile(
                title: Text('Wishlist'),
                subtitle: Text('Buy from items in wishlist'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.heart_broken_sharp,
                  size: 30,
                ),
                //contentPadding: EdgeInsets.all(20),
                //enabled: false,
                onTap: () {
                  print('onTap Pressed!');
                  Navigator.pushNamed(context, "wishlist");
                },
                iconColor: Color.fromARGB(255, 234, 212, 212),
                textColor: Color.fromARGB(255, 234, 212, 212),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 122, 130, 218),
              child: ListTile(
                title: Text('Orders'),
                subtitle: Text('Check your order details'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.shopping_bag_sharp,
                  size: 30,
                ),
                //contentPadding: EdgeInsets.all(20),
                //enabled: false,
                onTap: () {
                  print('onTap Pressed!');
                },
                iconColor: Color.fromARGB(255, 234, 212, 212),
                textColor: Color.fromARGB(255, 234, 212, 212),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 122, 130, 218),
              child: ListTile(
                title: Text('My Delivery Address'),
                subtitle: Text('Get help for your account'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.location_city,
                  size: 30,
                ),
                //contentPadding: EdgeInsets.all(20),
                //enabled: false,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DeliveryDetails(),
                    ),
                  );
                },

                iconColor: Color.fromARGB(255, 234, 212, 212),
                textColor: Color.fromARGB(255, 234, 212, 212),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 150),
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(
                  Icons.logout_sharp,
                  size: 30,
                ),
                onTap: () {
                  Navigator.pushNamed(context, "LoginPage");
                },
                iconColor: Color.fromARGB(255, 209, 59, 48),
                textColor: Color.fromARGB(255, 209, 59, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
