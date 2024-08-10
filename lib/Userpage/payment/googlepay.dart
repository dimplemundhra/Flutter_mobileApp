import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pay/pay.dart';
import 'package:shopping1_app/Userpage/payment/payment_config.dart';

class MyGoogle_pay extends StatefulWidget {
  

  @override

  State<MyGoogle_pay> createState() => _MyGoogle_payState();
}

class _MyGoogle_payState extends State<MyGoogle_pay> {
  var googlePayButton = GooglePayButton(
    paymentConfiguration:PaymentConfiguration.fromJsonString(defaultGooglePay), 
    paymentItems: const [
      PaymentItem(
        label: 'total',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
        )
    ], 
    width: double.infinity,
    type: GooglePayButtonType.pay,
    margin: EdgeInsets.only(top: 15),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(child:CircularProgressIndicator()),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(10),
      child: Center(child: googlePayButton),
      ),
    );
  }
}