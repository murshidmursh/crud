import 'dart:io';

import 'package:crud/colourtheme.dart';
import 'package:crud/imagepicture.dart';
import 'package:crud/login2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class imageupload extends StatefulWidget {
  const imageupload({super.key});

  @override
  State<imageupload> createState() => _imageuploadState();
}

class _imageuploadState extends State<imageupload> {
  var file;
  pickFile(ImageSource) async {
    final imgfile =
    await ImagePicker.platform.getImageFromSource(source: ImageSource);
    file = File(imgfile!.path);
    if (mounted) {
      setState(() {
        file = File(imgfile!.path);
      });
      uploadfile(file);
    }
  }

  bool upload=true;
  var Imgurl;
  uploadfile(File file) async {
    upload=true;
    setState(() {

    });
    var uploadtask=await FirebaseStorage.instance.ref("img").
    child("${DateTime.now()}").putFile(file!,SettableMetadata(
      contentType: "image/jpg"
    ));
    Imgurl=await uploadtask.ref.getDownloadURL();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("image upload")));
    upload=true;
    setState(() {

    });
  }
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
                      child: InkWell(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                Material(
                                  type: MaterialType.circle,
                                  color: Colors.transparent,
                                  child: CupertinoActionSheet(
                                      actions: <Widget>[
                                        CupertinoActionSheetAction(
                                          child: const Text('Photo Gallery'),
                                          onPressed: () {
                                            pickFile(ImageSource.gallery);
                                            Navigator.pop(context, 'One');
                                          },
                                        ),
                                        CupertinoActionSheetAction(
                                          child: const Text('Camera'),
                                          onPressed: () {
                                            pickFile(ImageSource.camera);
                                            Navigator.pop(context, 'Two');
                                          },
                                        )
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => login2(),));
                                          },
                                            child: Text('Cancel')),
                                        isDefaultAction: true,
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      )),
                                ),
                          );
                        },
                        child:   CircleAvatar(
                            backgroundColor: colourtheme.darkblue,
                            radius: w*0.04,
                            child:Padding(
                              padding:  EdgeInsets.all(w*0.02),
                              child: SvgPicture.asset(imagepicture.pen,color: colourtheme.white,),
                            )
                        ),
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
                Container(
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
                SizedBox(height: h*0.04),
                // Text("Already have an Account Login?",style: TextStyle(color: colourtheme.darkblue),)
              ],
            ),
          ),
        )
    );
  }
}
