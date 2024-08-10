import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/model/product_model.dart';
import 'package:shopping1_app/provider/wish_provider.dart';
import 'package:shopping1_app/widgets/single_item.dart';

class wishlist extends StatefulWidget {
  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  late WishListProvider wishListProvider;

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 28, color: Color(0xFF4C53A5)),
        title: Text(
          "Wishlist",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFF4C53A5),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];

          return Column(
            children: [
              SizedBox(
                height: 15,
              ),
              SingleItem(
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productQuantity: data.productQuantity,
                productId: data.productId,
                onDelete: () {}, wishlist: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
