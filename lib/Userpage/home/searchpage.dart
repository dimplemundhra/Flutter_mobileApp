import 'package:flutter/material.dart';
import 'package:shopping1_app/model/product_model.dart';
import 'package:shopping1_app/widgets/single_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({required this.search});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  searchItem(String query) {
    List<ProductModel> searchProd = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchProd;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 28, color: Color(0xFF4C53A5)),
        title: Text(
          "Search",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromARGB(255, 31, 41, 172),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color.fromARGB(255, 225, 226, 243),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                onDelete: () {},
                productId: data.productId,
                productQuantity: data.productQuantity,
                wishlist: true,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
