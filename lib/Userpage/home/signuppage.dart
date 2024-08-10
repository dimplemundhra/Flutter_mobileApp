import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/home/homepage.dart';
import 'package:shopping1_app/Userpage/home/loginpage.dart';
import 'package:shopping1_app/provider/user_provider.dart';
import 'package:shopping1_app/services/auth_service.dart';
import 'package:sign_button/sign_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordcontroller = TextEditingController();

  bool loading = false;

  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("full_name data");
    return _collectionRef
        .doc(currentUser!.email)
        .set({
          "name": nameController.text,
        })
        .then((value) => print("Name added"))
        .catchError((Error) => print("Something is wrong"));
  }

  @override
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Stack(children: [
        Positioned(
          right: -getSmallDiameter(context) / 3,
          top: -getSmallDiameter(context) / 3,
          child: Container(
            width: getSmallDiameter(context),
            height: getSmallDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 61, 75, 228),
                  Color.fromARGB(255, 154, 161, 235)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          left: -getBigDiameter(context) / 4,
          top: -getBigDiameter(context) / 3,
          child: Container(
            width: getBigDiameter(context),
            height: getBigDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 51, 66, 223),
                  Color.fromARGB(255, 169, 175, 233),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.only(top: 30, left: 80),
            child: Center(
              child: Text(
                "Amore Fashion",
                style: GoogleFonts.dancingScript(
                  textStyle: TextStyle(
                    fontSize: 33,
                    color: Color.fromARGB(255, 211, 211, 224),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -getSmallDiameter(context) / 3,
          top: -getSmallDiameter(context) / 3,
          child: Container(
            width: getBigDiameter(context),
            height: getBigDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: Color(0XFFF3E9EE),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ListView(
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(30, 300, 20, 10),
                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 44, 58, 217),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      labelText: "Full Name",
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      )),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(30, 10, 20, 10),
                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 44, 58, 217),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      labelText: "User Email",
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      )),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(30, 10, 20, 10),
                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color.fromARGB(255, 44, 58, 217),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      labelText: "Password",
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      )),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(30, 20, 20, 10),
                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  obscureText: true,
                  controller: confirmpasswordcontroller,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color.fromARGB(255, 44, 58, 217),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      labelText: "Confirm Password",
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      )),
                ),
              ),
              loading
                  ? CircularProgressIndicator(color: Colors.deepPurple)
                  : Container(
                      margin: EdgeInsets.fromLTRB(60, 20, 60, 20),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 61, 75, 228),
                            Color.fromARGB(255, 154, 161, 235)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 124, 44, 222),
                        ),
                        onPressed: () async {
                          sendUserDataToDB();
                          setState(() {
                            loading = true;
                          });
                          if (emailController.text == "" ||
                              passwordController.text == "" ||
                              nameController.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("All fields are required!"),
                              backgroundColor: Colors.red,
                            ));
                          } else if (passwordController.text !=
                              confirmpasswordcontroller.text) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Incorrect Password!"),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            User? result = await AuthService().register(
                                emailController.text,
                                passwordController.text,
                                context);
                            if (result != null) {
                              print("success");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => homepage(),
                                  ),
                                  (route) => false);
                            }
                          }

                          setState(() {
                            loading = false;
                          });
                        },
                        // child: Material(
                        //   borderRadius: BorderRadius.circular(30),
                        //   color: Colors.transparent,
                        //   child: InkWell(
                        //     borderRadius: BorderRadius.circular(30),
                        //     splashColor: Colors.amber,
                        //     child: Align(
                        //       alignment: Alignment.center,

                        child: Text(
                          "CREATE AN ACCOUNT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
              // ),
              //),
              //),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ALREADY HAVE AN ACCOUNT ?",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.amber,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "SIGN IN ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 58, 217),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
