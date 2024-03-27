import 'package:crud/app_authetication/login.dart';
import 'package:crud/colourtheme.dart';
import 'package:crud/imagepicture.dart';
import 'package:crud/login2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: colourtheme.white,
      body: Column(
        children: [
          SizedBox(height: h*0.15),
          Image(image: AssetImage(imagepicture.build)),
          SizedBox(height: h*0.04),
          Center(
            child: Text("CRUD",style: TextStyle(
              fontSize: w*0.07,
                  fontWeight: FontWeight.w900,
              color: colourtheme.darkblue
            )),
          ),
          Text("Create, Read, Update ,Delete",style: TextStyle(
            color: colourtheme.darkblue
          ),),
          SizedBox(height: h*0.02),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
            },
            child: Container(
              height: h*0.07,
              width: w*0.56,
              decoration: BoxDecoration(
                  color: colourtheme.darkblue,
                borderRadius: BorderRadius.circular(w*0.06)
              ),
              child: Center(
                child: Text("Login",style: TextStyle(
                  color:colourtheme.white
                )),
              ),

            ),
          ),
          SizedBox(height: h*0.03),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => login2(),));
            },
            child: Container(
              height: h*0.07,
              width: w*0.56,
              decoration: BoxDecoration(
                  border: Border.all(color: colourtheme.darkblue),
                borderRadius: BorderRadius.circular(w*0.06)
              ),
              child: Center(
                child: Text("Sign up",style: TextStyle(
                    color:colourtheme.darkblue
                )),
              ),

            ),
          )
        ],
      ),
    );
  }
}
