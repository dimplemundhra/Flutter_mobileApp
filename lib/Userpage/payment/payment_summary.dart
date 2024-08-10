import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/delivery/singledeliver.dart';
import 'package:shopping1_app/model/deliverAdd_model.dart';
import 'package:shopping1_app/provider/cart_provider.dart';
import 'package:shopping1_app/Userpage/payment/googlepay.dart';
import 'package:shopping1_app/widgets/orderitem.dart';
import 'package:shopping1_app/Userpage/payment/payment_config.dart';

class PaymentSummary extends StatefulWidget {
  late CartProvider cartProvider;

  final DeliveryAddressModel deliverAddressList;

  PaymentSummary({required this.deliverAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    CartProvider cartPageProvider = Provider.of(context);
    cartPageProvider.getCartData();

    double discount = 30;
    double discountValue;
    double shippingCharge = 3.7;
    double total;
    double totalPrice = cartPageProvider.getTotalPrice();
    if (totalPrice > 2000) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 28, color: Color(0xFF4C53A5)),
        title: Text(
          "Payment Summary",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFF4C53A5),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          ("\$${totalPrice}"),
          //"\$${total + 5 ?? totalPrice}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              myType == AddressTypes.OnlinePayment
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyGoogle_pay(
                            //total: totalPrice,
                            ),
                      ),
                    )
                  : Container();
            },
            child: Text(
              "Place Order",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Color(0xFF4C53A5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address:
                      "${widget.deliverAddressList.area},${widget.deliverAddressList.pinCode}",
                  title:
                      "${widget.deliverAddressList.firstName} ${widget.deliverAddressList.lastName}",
                  number: widget.deliverAddressList.mobileNo,
                  addressType: widget.deliverAddressList.addressType ==
                          "AddressTypes.Home"
                      ? "Home"
                      : widget.deliverAddressList.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : "Work",
                ),
                Divider(),
                ExpansionTile(
                  children: cartPageProvider.getCartDataList.map((e) {
                    return OrderItem(
                      e: e,
                    );
                  }).toList(),
                  title: Text(
                      "Order Items ${cartPageProvider.getCartDataList.length}"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\$${totalPrice}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    ("\$${50}"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Coupon Discount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$10",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myType,
                  title: Text("Cash on Delivery"),
                  onChanged: (value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myType,
                  title: Text("OnlinePayment"),
                  onChanged: (value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
