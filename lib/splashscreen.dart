import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/app_authetication/login.dart';
import 'package:crud/app_authetication/signup.dart';
import 'package:crud/cart2.dart';
import 'package:crud/cart3.dart';
import 'package:crud/colourtheme.dart';
import 'package:crud/homepage.dart';
import 'package:crud/imagepicture.dart';
import 'package:crud/imageupload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  getlogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    FirebaseFirestore.instance.collection('collectionPath').add({
      'test':'test'
    });

    bool loginBool = false;

    loginBool = prefs.getBool('login')??false;

    Future.delayed(Duration(
      seconds:2,
    )
    ).then((value){
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>loginBool == true?homepage() :signup()));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cart3(),));
    },);
  }
  void initState() {
    getlogin();
    // TODO: implement initState
    super.initState();

  }
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: colourtheme.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("food",style: TextStyle(
              color: colourtheme.white,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07,
            ),),
          ),
SvgPicture.asset(imagepicture.food),
        ],
      ),
    );
  }
}
