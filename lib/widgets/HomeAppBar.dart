import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/home/searchpage.dart';
import 'package:shopping1_app/Userpage/payment/wishlist.dart';
import 'package:shopping1_app/provider/product_provider.dart';

class HomeAppBar extends StatefulWidget {
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late ProductProvider productProvider;

  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchhomeDressProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(
      context,
    );
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(children: [
        // SizedBox(
        //   height: 50,
        //   child: Image.asset(
        //     "assets/images/AFlogo.png",
        //   ),
        // ),
        Text(
          'Amore Fashion',
          style: GoogleFonts.dancingScript(
            textStyle: TextStyle(
              fontSize: 26,
              color: Color(0xFF4C53A5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90),
          child: const Spacer(),
        ),

        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Search(
                  search: productProvider.gethomeDressProductDataList,
                ),
              ),
            );
          },
          child: Icon(
            Icons.search,
            size: 28,
            color: Color(0xFF4C53A5),
          ),
        ),

        Spacer(),
        Badge(
          backgroundColor: Colors.red,
          padding: EdgeInsets.all(7),
          textStyle: TextStyle(
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => wishlist(),
                ),
              );
            },
            child: Icon(
              Icons.favorite,
              size: 30,
              color: Color.fromARGB(255, 229, 48, 35),
            ),
          ),
        ),
      ]),
    );
  }
}
