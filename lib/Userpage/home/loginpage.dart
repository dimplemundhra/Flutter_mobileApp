import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shopping1_app/Userpage/home/homepage.dart';
import 'package:shopping1_app/Userpage/home/signuppage.dart';
import 'package:shopping1_app/provider/user_provider.dart';
import 'package:shopping1_app/services/auth_service.dart';
import 'package:sign_button/sign_button.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UserProvider userProvider;
  Future<void> _googleSignUp() async {
    {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
    }
  }

  final FirebaseAuth_auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  @override
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Stack(
        children: [
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
                    Color.fromARGB(255, 44, 58, 217),
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
                  margin: EdgeInsets.fromLTRB(30, 300, 20, 10),
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
                        labelText: "Email",
                        enabledBorder: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 20, 10),
                  padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
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
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
                    child: Text(
                      "FORGOT PASSWORD ?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 58, 217),
                        fontSize: 12,
                      ),
                    ),
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
                              setState(() {
                                loading = true;
                              });
                              if (emailController.text == "" ||
                                  passwordController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("All fields are required!"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                User? result = await AuthService().login(
                                    emailController.text,
                                    passwordController.text);
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
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                splashColor: Colors.amber,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                Column(
                  children: [
                    SignInButton(
                      buttonType: ButtonType.google,
                      btnText: "Google SignIn",
                      buttonSize: ButtonSize.small,
                      btnColor: Colors.black,
                      btnTextColor: Colors.white,
                      onPressed: () async {
                        await _googleSignUp().then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => homepage(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DON'T HAVE AN ACCOUNT ?",
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
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Color.fromARGB(255, 44, 58, 217),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
