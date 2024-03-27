import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colourtheme.dart';
import 'package:crud/homepage2.dart';
import 'package:crud/imagepicture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'app_authetication/usermodel.dart';
import 'main.dart';

class edituser extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final String Confirmpassword;
  final Usermodel model;
  const edituser({super.key, required this.name, required this.email, required this.password, required this.Confirmpassword, required this.model});

  @override
  State<edituser> createState() => _edituserState();
}

class _edituserState extends State<edituser> {
  TextEditingController fullnameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  var file;
  pickFile(ImageSource) async {
    final imgfile =
    await ImagePicker.platform.getImageFromSource(source: ImageSource);
    file = File(imgfile!.path);
    if (mounted) {
      setState(() {
        file = File(imgfile!.path);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    fullnameController.text=widget.model.name.toString();
    emailController.text=widget.model.email.toString();
    passwordController.text=widget.model.password.toString();
    confirmpasswordController.text=widget.model.confirmpassword.toString();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colourtheme.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: colourtheme.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
              child: SvgPicture.asset(imagepicture.aaro)),
          title: Text("Edit User",style: TextStyle(
            fontWeight: FontWeight.w700,
            color: colourtheme.seconderycolor,
            fontSize: w*0.06,
          )),

        ),
        body:SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(w*0.03),
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
                            padding:  EdgeInsets.all(w*0.02),
                            child: SvgPicture.asset(imagepicture.pen,color: colourtheme.white,),
                          )
                      ),

                    )
                  ],
                ),
                SizedBox(height:h*0.02),
                Container(
                  decoration: BoxDecoration(
                      color: colourtheme.grey2,
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: fullnameController,
                    decoration: InputDecoration(
                        hintText: "Full name",
                        labelText: "Full name",
                        border:InputBorder.none,
                        suffixIcon: Padding(
                          padding:  EdgeInsets.all(w*0.02),
                          child: SvgPicture.asset(imagepicture.name),
                        )
                    ),
                  ),
                ),
                SizedBox(height:h*0.02),
                Container(
                  decoration: BoxDecoration(
                      color: colourtheme.grey2,
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "valid email",
                        labelText: "email",
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding:  EdgeInsets.all(w*0.02),
                          child: SvgPicture.asset(imagepicture.mail),
                        )
                    ),
                  ),
                ),
                SizedBox(height:h*0.02),
                Container(
                  color: colourtheme.grey2,
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "password",
                        labelText: "password",
                        border:InputBorder.none,
                        suffixIcon: Padding(
                          padding:  EdgeInsets.all(w*0.02),
                          child: SvgPicture.asset(imagepicture.lock2),
                        )
                    ),
                  ),
                ),
                SizedBox(height:h*0.02),
                Container(
                  decoration: BoxDecoration(
                      color: colourtheme.grey2,
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  child: TextFormField(
                    controller: confirmpasswordController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: " Password",
                        labelText: " Confirm password",
                        suffixIcon: Padding(
                          padding:  EdgeInsets.all(w*0.02),
                          child: SvgPicture.asset(imagepicture.lock2),
                        )
                    ),
                  ),
                ),
                SizedBox(height: h*0.02,),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w*0.03)),
                          title: Column(
                            children: [
                              Text("Are you Sure ",style: GoogleFonts.poppins(
                                  fontSize: w*0.04,
                                  fontWeight: FontWeight.w400,
                                  color: colourtheme.seconderycolor
                              )),
                              Text("You Want to edit User ? ",style: GoogleFonts.poppins(
                                  fontSize: w*0.04,
                                  fontWeight: FontWeight.w400,
                                  color: colourtheme.seconderycolor
                              )),

                            ],
                          ),
                          actions: [
                            Center(
                              child: Column(
                                children: [
                                  Divider(),
                                  InkWell(
                                    child: InkWell(
                                      onTap: () {
                                        // FirebaseFirestore.instance.collection("student").doc(widget.email).update({
                                        //   "name":fullnameController.text,
                                        //   "email":emailController.text,
                                        //   "password":passwordController.text,
                                        //   "confirmPassword":confirmpasswordController.text
                                        // });
                                        FirebaseFirestore.instance.collection("model").doc(widget.model.id).update(
                                          widget.model.copywith(email: emailController.text).toMap()
                                        );
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => homepage2(),));
                                      },
                                      child: Container(
                                        width: w*1,
                                        height: w*0.1,
                                        child: Center(
                                          child: Text("Confirm",style: GoogleFonts.poppins(
                                              fontSize: w*0.06,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      width: w*1,
                                      height: w*0.1,
                                      child: Center(
                                        child: Text("Cancel",style: GoogleFonts.poppins(
                                            fontSize: w*0.06,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: h*0.07,
                    width: w*0.56,
                    decoration: BoxDecoration(
                        border: Border.all(color: colourtheme.darkblue),
                        borderRadius: BorderRadius.circular(w*0.06)
                    ),
                    child: Center(
                      child: Text("Edit User",style: TextStyle(
                          color:colourtheme.darkblue,
                          fontSize: w*0.05
                      )),
                    ),

                  ),
                ),
                SizedBox(height: h*0.04),
                // Text("Already have an Account Login?",style: TextStyle(color: colourtheme.darkblue),)
              ],
            ),
          ),
        )
    );
  }


}