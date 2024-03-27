

import 'package:crud/adduser.dart';
import 'package:crud/api.dart';
import 'package:crud/app_authetication/cartpage.dart';
import 'package:crud/app_authetication/login.dart';
import 'package:crud/app_authetication/signup.dart';
import 'package:crud/banner.dart';
import 'package:crud/cart2.dart';
import 'package:crud/cart3.dart';
import 'package:crud/deletealert.dart';
import 'package:crud/edituser.dart';
import 'package:crud/homepage.dart';
import 'package:crud/homepage2.dart';
import 'package:crud/imageupload.dart';
import 'package:crud/login2.dart';
import 'package:crud/otp.dart';
import 'package:crud/phone.dart';
import 'package:crud/profile.dart';
import 'package:crud/splashscreen.dart';
import 'package:crud/update.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
var w;
var h;
var username;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
          textTheme:GoogleFonts.poppinsTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        home: cart3(),
      )
    );
  }
}

