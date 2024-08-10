import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/cart/addDelAdd.dart';
import 'package:shopping1_app/Userpage/delivery/singledeliver.dart';
import 'package:shopping1_app/Userpage/payment/payment_summary.dart';
import 'package:shopping1_app/model/deliverAdd_model.dart';
import 'package:shopping1_app/provider/checkout_provider.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 28, color: Color(0xFF4C53A5)),
        title: Text(
          "Delivery Details",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFF4C53A5),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4C53A5),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAdd(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,

        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          color: Color(0xFF4C53A5),
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text(
                  "Add new Address",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              : Text(
                  "Payment Summary",
                  style: TextStyle(color: Colors.white),
                ),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliveryAdd(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(
                        deliverAddressList: value,
                      ),
                    ),
                  );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Deliver To",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Image.asset(
              "assets/images/location.png",
              height: 30,
              alignment: Alignment.topLeft,
            ),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Center(
                  child: Container(
                    child: Center(
                      child: Text("No Data"),
                    ),
                  ),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    setState(() {
                      value = e;
                    });
                    return SingleDeliveryItem(
                      address: "${e.area}, ${e.pinCode}",
                      title: "${e.firstName} ${e.lastName}",
                      number: e.mobileNo,
                      addressType: e.addressType == "AddressTypes.Home"
                          ? "Home"
                          : e.addressType == "AddressTypes.Other"
                              ? "Other"
                              : "Work",
                    );
                  }).toList(),
                )
        ],
      ),
    );
  }
}
