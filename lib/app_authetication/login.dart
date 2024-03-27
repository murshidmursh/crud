import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/app_authetication/signup.dart';
import 'package:crud/colourtheme.dart';
import 'package:crud/homepage.dart';
import 'package:crud/imagepicture.dart';
import 'package:crud/login2.dart';
import 'package:crud/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final emailvalidation = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final passwordvalidation =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
final email = TextEditingController();
final password = TextEditingController();
final formkey=GlobalKey<FormState>();
bool pass = false;


Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colourtheme.white,
        title: Text("CRUD",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: colourtheme.seconderycolor)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: h * 0.01),
              Image(image: AssetImage(imagepicture.crud1)),
              SizedBox(height: h * 0.02),
              Padding(
                padding: EdgeInsets.all(w * 0.02),
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (!emailvalidation.hasMatch(value!)) {
                          return "entire  valid email address";
                        }
                        return null;
                      },
                      style: TextStyle(
                          fontSize: w * 0.05, fontWeight: FontWeight.w500),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "User name",
                        hintText: "enter your email address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.03),
                        ),
                      ),
                    ),
                    SizedBox(height: w * 0.02),
                    TextFormField(
                      controller: password,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: pass ? false : true,
                      validator: (value) {
                        if (!passwordvalidation.hasMatch(value!)) {
                          return "entire valid password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "enter password",
                        labelText: "password",
                        suffixIcon: InkWell(
                            onTap: () {
                              pass = !pass;
                              setState(() {});
                            },
                            child: Icon(pass == true
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.03),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.01),
              InkWell(
                onTap: () async {

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => homepage(),
                  //     ));
                  // if(
                  // email.text!=""&&
                  //     password.text!=""
                  // ){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(),));
                  // }else{
                  //   email.text==""?ScaffoldMessenger.of(context).
                  //   showSnackBar(SnackBar(content:Text("pleas enter your valid email") )):
                  //   password.text==""?ScaffoldMessenger.of(context).
                  //   showSnackBar(SnackBar(content: Text("please enter your valid password"))):
                  //       ScaffoldMessenger.of(context).
                  //       showSnackBar(SnackBar(content: Text("enter your valid details")));
                  // }

                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text.trim(),
                      password: password.text.trim()
                  ).then((value) async {

                    var data = await FirebaseFirestore.instance.collection("add").where(
                        "email",isEqualTo: email.text.trim()).get();

                    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAA${data.docs.first.data()}");
                    username=data.docs[0]["name"];

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("name", username.toString());

                    Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(),));

                  }).catchError((error){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                  });

                },
                child: Container(
                  height: h * 0.07,
                  width: w * 0.59,
                  decoration: BoxDecoration(
                      border: Border.all(color: colourtheme.darkblue),
                      borderRadius: BorderRadius.circular(w * 0.06)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: SvgPicture.asset(imagepicture.lock)),
                      Row(
                        children: [
                          Text("Login",
                              style: TextStyle(
                                color: colourtheme.darkblue,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.01),
              InkWell(
                onTap: () {
                  signInWithGoogle().then((value) =>
                     Navigator.pushAndRemoveUntil(
                         context, MaterialPageRoute(builder: (context) =>homepage() ),(route) => false,));
                },
                child: Container(
                  height: h * 0.07,
                  width: w * 0.59,
                  decoration: BoxDecoration(
                      border: Border.all(color: colourtheme.darkblue),
                      borderRadius: BorderRadius.circular(w * 0.06)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: SvgPicture.asset(imagepicture.google)),
                      Row(
                        children: [
                          Text(" Sign in with Google",
                              style: TextStyle(
                                color: colourtheme.darkblue,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.01),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => phone(),
                      ));
                },
                child: Container(
                  height: h * 0.07,
                  width: w * 0.59,
                  decoration: BoxDecoration(
                      border: Border.all(color: colourtheme.darkblue),
                      borderRadius: BorderRadius.circular(w * 0.06)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: SvgPicture.asset(imagepicture.phone)),
                      Row(
                        children: [
                          Text("OTP sign in",
                              style: TextStyle(
                                color: colourtheme.darkblue,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => login2(),
                      ));
                },
                child: Text(
                  "Don’t have an account ?Create Now",
                  style: TextStyle(
                    color: colourtheme.darkblue,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
