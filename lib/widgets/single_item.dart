import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
//import 'package:shopping1_app/Userpage/wishlist.dart';
import 'package:shopping1_app/provider/cart_provider.dart';
import 'package:shopping1_app/Userpage/cart/count.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  bool wishlist = false;
  final String productImage;
  final String productName;
  final int productPrice;
  final int productQuantity;
  final String productId;
  final Function onDelete;

  SingleItem({
    required this.isBool,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.onDelete,
    required this.wishlist,
    required this.productQuantity,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();

  //static map(SingleItem Function(dynamic data)) {}
}

class _SingleItemState extends State<SingleItem> {
  late CartProvider cartPageProvider;

  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    cartPageProvider = Provider.of<CartProvider>(context);
    cartPageProvider.getCartData();
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                child: Center(
                  child: Image.network(widget.productImage),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 38,
                child: Column(
                  mainAxisAlignment: widget.isBool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 31, 41, 172),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "\$${widget.productPrice}",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 31, 41, 172),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: widget.isBool == false
                    ? const EdgeInsets.symmetric(horizontal: 7, vertical: 7)
                    : const EdgeInsets.only(left: 7, right: 7),
                child: widget.isBool == false
                    ? Count(
                        productId: widget.productId,
                        productImage: widget.productImage,
                        productName: widget.productName,
                        productPrice: widget.productPrice,
                        productQuantity: widget.productQuantity,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () => widget.onDelete,
                              child: const Icon(
                                Icons.delete,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.wishlist == false
                                ? Container(
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 31, 41, 172)),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (count == 1) {
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "You reach minimum limit",
                                                );
                                              } else {
                                                setState(() {
                                                  count--;
                                                });
                                                cartPageProvider.updateCartData(
                                                  cartImage:
                                                      widget.productImage,
                                                  cartId: widget.productId,
                                                  cartName: widget.productName,
                                                  cartPrice:
                                                      widget.productPrice,
                                                  cartQuantity: count,
                                                );
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Color.fromARGB(
                                                  255, 31, 41, 172),
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            "$count",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 31, 41, 172),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (count < 10) {
                                                setState(() {
                                                  count++;
                                                });
                                                cartPageProvider.updateCartData(
                                                  cartId: widget.productId,
                                                  cartImage:
                                                      widget.productImage,
                                                  cartName: widget.productName,
                                                  cartPrice:
                                                      widget.productPrice,
                                                  cartQuantity: count,
                                                );
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Color.fromARGB(
                                                  255, 31, 41, 172),
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
      widget.isBool == false
          ? Container()
          : Divider(
              height: 1,
              color: Colors.black,
            ),
    ]);
  }
}
