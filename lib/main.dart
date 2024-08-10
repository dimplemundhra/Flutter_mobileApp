import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/cart/CartPage.dart';
import 'package:shopping1_app/Userpage/account/accPage.dart';
//import 'package:shopping1_app/Userpage/billpage.dart';
import 'package:shopping1_app/Userpage/home/homepage.dart';
import 'package:shopping1_app/Userpage/home/loginpage.dart';
import 'package:shopping1_app/Userpage/products/product_detail.dart';
import 'package:shopping1_app/Userpage/products/productpage.dart';
import 'package:shopping1_app/Userpage/products/productpage1.dart';
import 'package:shopping1_app/Userpage/products/productpageS2.dart';
import 'package:shopping1_app/Userpage/products/productpageb3.dart';
import 'package:shopping1_app/Userpage/products/productpagew4.dart';
//import 'package:shopping1_app/Userpage/searchpage.dart';
import 'package:shopping1_app/Userpage/home/signuppage.dart';
import 'package:shopping1_app/Userpage/home/splash.dart';
import 'package:shopping1_app/Userpage/payment/wishlist.dart';
import 'package:shopping1_app/Userpage/account/help.dart';
import 'package:shopping1_app/provider/cart_provider.dart';
import 'package:shopping1_app/provider/checkout_provider.dart';
import 'package:shopping1_app/provider/user_provider.dart';
import 'package:shopping1_app/provider/wish_provider.dart';
import 'package:shopping1_app/Userpage/account/profile.dart';
import 'package:shopping1_app/provider/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        // home: StreamBuilder(stream:FirebaseAuth.instance.authStateChanges(),
        //  builder:(context,snapshot){
        //   if
        //  } ),
        routes: {
          "/": (context) => const splashScreen(),
          "signupPage": (context) => SignUpPage(),
          "cartPage": (context) => CartPage(),
          "wishlist": (context) => wishlist(),
          "LoginPage": (context) => LoginPage(),
          "HomePage": (context) => homepage(),
          "productpage": (context) => productpage(),
          "productpage1": (context) => productpage1(),
          "productpageS2": (context) => productpageS2(),
          "productpageb3": (context) => productpageb3(),
          "productpagew4": (context) => productpagew4(),
          //"billPage": (context) => billPage(),
          "accPage": (context) => accPage(),
          //"profilePage": (context) => profilePage(),
          "helpPage": (context) => helpPage(),
          "splashScreen": (context) => const splashScreen(),
          //"searchpage": (context) => Search(),
          "product_detail": (context) => product_detail(
                prodImage: '',
                prodName: '',
              ),
        },
      ),
    );
  }
}
