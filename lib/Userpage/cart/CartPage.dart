import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/delivery/deliveryDetails.dart';
import 'package:shopping1_app/model/cart_model.dart';
import 'package:shopping1_app/provider/cart_provider.dart';
import 'package:shopping1_app/widgets/single_item.dart';
import 'package:shopping1_app/Userpage/products/single_product.dart';

class CartPage extends StatelessWidget {
  late CartProvider cartPageProvider;

  showAlertDialog(BuildContext context, CartModel delete) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Yes"),
      onPressed: () {
        cartPageProvider.CartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("DO you want to remove cartProduct?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    cartPageProvider = Provider.of<CartProvider>(context);
    cartPageProvider.getCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$ ${cartPageProvider.getTotalPrice()}",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            textColor: Colors.white,
            color: Color(0xFF4C53A5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () {
              // if (cartPageProvider.getCartDataList.isEmpty) {
              // return Fluttertoast.showToast(msg:"No Cart Data Found");
              // }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DeliveryDetails(),
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(size: 28, color: Color(0xFF4C53A5)),
        title: Text(
          "Your Cart",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFF4C53A5),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: cartPageProvider.getCartDataList.isEmpty
          ? Center(
              child: Text("NO DATA"),
            )
          : ListView.builder(
              itemCount: cartPageProvider.getCartDataList.length,
              itemBuilder: (context, index) {
                CartModel data = cartPageProvider.getCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.productPrice,
                      productQuantity: data.cartQuantity,
                      productId: data.cartId,
                      isBool: true,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                      wishlist: false,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
