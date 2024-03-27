import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/app_authetication/login.dart';
import 'package:crud/app_authetication/signup.dart';
import 'package:crud/colourtheme.dart';
import 'package:crud/homepage.dart';
import 'package:crud/imagepicture.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class login2 extends StatefulWidget {
  const login2({super.key});

  @override
  State<login2> createState() => _login2State();
}

class _login2State extends State<login2> {
  pickfile(ImageSource) async {
    final pickedFile=await ImagePicker.platform.pickImage(source: ImageSource);
    file=File(pickedFile!.path);
    if(mounted){
      setState(() {
     file=File(pickedFile.path);
      });
      uploadFle(file);
    }
  }
  var file;
  bool loading=false;
var Imgeurl;
  uploadFle(File file) async {
    loading=true;
    setState(() {

    });
    var uploadTask =await FirebaseStorage.instance.
    ref('img').child("${DateTime.now()}").putFile(file!,SettableMetadata(
      contentType: "image/jpg"
    ));
    Imgeurl=await uploadTask.ref.getDownloadURL();
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text("image upload")));
    loading =false;
    setState(() {

    });
  }

 TextEditingController nameController =TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colourtheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colourtheme.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: SvgPicture.asset(imagepicture.aaro)),
        title: Text("User Registration",style: TextStyle(
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
loading?CircularProgressIndicator():
  Container(
    child: Stack(
    children:[   Center(
      child: Imgeurl!=null? CircleAvatar(
            backgroundImage: FileImage(file),
            radius: w*0.25,
      ):CircleAvatar(
        radius: w*0.25,
      )
    ),
Positioned(
    right: w*0.33,
    top: w*0.42,
    child:   InkWell(
      onTap: () {

       showCupertinoModalPopup(
           context: context,
           builder: (context) {
             return CupertinoActionSheet(
               actions: [
                 CupertinoActionSheetAction(
                     onPressed: () {
                       Navigator.pop(context);
                       pickfile(ImageSource.gallery);
                     },
                     // isDefaultAction: true,
                     child: Text("Photo Gallery",style: TextStyle(
                       fontSize: w*0.05
                     ),)),
                 CupertinoActionSheetAction(
                     onPressed: () {
                       pickfile(ImageSource.camera);
                     },
                     child: Text("Camera",style: TextStyle(
                       fontSize: w*0.05,
                       fontWeight: FontWeight.w600
                     ),))
               ],
               cancelButton: CupertinoActionSheetAction(
                   onPressed: () {

                   }, child:Text("Cancel",style: TextStyle(
                 fontWeight: FontWeight.w600
               ),) ),
             );
           },);
      },
      child: CircleAvatar(
        backgroundColor: colourtheme.darkblue,
      radius: w*0.04,
         child:Padding(
           padding: EdgeInsets.all(w*0.02),
           child: SvgPicture.asset(imagepicture.pen,color: colourtheme.white,),
         )
      ),
    ),

)
    ],
),
  ),
  SizedBox(height:h*0.02),
  Container(
    decoration: BoxDecoration(
        color: colourtheme.grey2,
      borderRadius: BorderRadius.circular(w*0.03)
    ),
    child: TextFormField(
      controller: nameController,
keyboardType: TextInputType.name,
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
    decoration: BoxDecoration(
        color: colourtheme.grey2,
      borderRadius: BorderRadius.circular(w*0.03)
    ),

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
    onTap: () async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("name", username.toString());

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: password.text.trim()).then((value) {

            FirebaseFirestore.instance.collection("add").add({
              "name": nameController.text,
              "email": emailController.text,
              "password":passwordController.text
            });

            Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(),));
      }).catchError((error){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
      });
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
                color:colourtheme.darkblue,
              fontSize: w*0.05
            )),
      ),

    ),
  ),
  SizedBox(height: h*0.01),
  InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
    },
    child: Text("Already have an Account Login?",style: TextStyle(
        color: colourtheme.darkblue),),
  )
],

          ),
        ),
      )
    );

  }
}
