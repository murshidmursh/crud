import 'package:crud/colourtheme.dart';
import 'package:crud/imagepicture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_authetication/login.dart';
import 'main.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colourtheme.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Profile",style: TextStyle(
            color: colourtheme.seconderycolor,
            fontWeight: FontWeight.w600,
            fontSize: w*0.05
        )),
        backgroundColor: colourtheme.white,
        leading: SvgPicture.asset(imagepicture.aaro),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(w*0.03),
        child: SingleChildScrollView(
          child: Column(
              children: [
                Stack(
                  children:[   Center(
                    child:   CircleAvatar(
                      backgroundImage: AssetImage(imagepicture.men),
                      radius: w*0.25,
                    ),
                  ),
                    Positioned(
                      right: w*0.33,
                      top: w*0.42,
                      child:   CircleAvatar(
                          backgroundColor: colourtheme.darkblue,
                          radius: w*0.04,
                          child:Padding(
                            padding: EdgeInsets.all(w*0.02),
                            child: SvgPicture.asset(imagepicture.pen,color: colourtheme.white,),
                          )
                      ),

                    )
                  ],
                ),
                SizedBox(height: h*0.06),
                Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Enter name",
                        labelText: "Enter name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.03),
                        ),
                      ),
                    ),
                    SizedBox(height: h*0.03),
                    TextFormField(
                      controller: email,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(!emailvalidation.hasMatch(value!)){
                          return"entire  valid email address";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: w*0.05,fontWeight:FontWeight.w500),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "User name",
                        hintText: "enter your email address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.03),
                        ),
                      ),
                    ),
                    SizedBox(height: w*0.02),
                    TextFormField(
                      controller: password,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: pass?false:true,
                      validator: (value) {
                        if (
                        !passwordvalidation.hasMatch(value!)
                        ){
                          return"entire valid password";
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "enter password",
                        labelText: "password",
                        suffixIcon: InkWell(
                            onTap: () {
                              pass=!pass;
                              setState(() {

                              });
                            },
                            child: Icon(pass==true?Icons.visibility:Icons.visibility_off)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.03),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h*0.03,),
                Container(
                  height: h*0.07,
                  width: w*0.56,
                  decoration: BoxDecoration(
                      border: Border.all(color: colourtheme.darkblue),
                      borderRadius: BorderRadius.circular(w*0.06)
                  ),
                  child: Center(
                    child: Text("Update",style: TextStyle(
                        color:colourtheme.darkblue,
                        fontSize: w*0.05
                    )),
                  ),

                ),
              ]
          ),



        ),
      ),
    );
  }
}
