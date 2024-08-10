import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/payment/payment_summary.dart';
import 'package:shopping1_app/provider/checkout_provider.dart';
import 'package:shopping1_app/widgets/custom_text_field.dart';

class AddDeliveryAdd extends StatefulWidget {
  @override
  State<AddDeliveryAdd> createState() => _AddDeliveryAddState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddState extends State<AddDeliveryAdd> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 28, color: Color(0xFF4C53A5)),
        title: Text(
          "Add Details",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFF4C53A5),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloadding == true
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Color(0xFF4C53A5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First name",
              controller: checkoutProvider.firstName,
              keyboardType: TextInputType.name,
            ),
            CustomTextField(
              labText: "Last name",
              controller: checkoutProvider.lastName,
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              labText: "Mobile Number",
              controller: checkoutProvider.mobileNo,
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              labText: "Pin Code",
              controller: checkoutProvider.pincode,
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              labText: "LandMark",
              controller: checkoutProvider.landmark,
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              labText: "City",
              controller: checkoutProvider.city,
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              labText: "Area",
              controller: checkoutProvider.area,
              keyboardType: TextInputType.streetAddress,
            ),
            ListTile(
              title: Text(
                "Address Type*",
                textAlign: TextAlign.left,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home_outlined,
                color: Color(0xFF4C53A5),
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work_history_outlined,
                color: Color(0xFF4C53A5),
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.mobile_friendly_outlined,
                color: Color(0xFF4C53A5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
