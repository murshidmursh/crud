

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/adduser.dart';
import 'package:crud/app_authetication/login.dart';
import 'package:crud/app_authetication/signup.dart';
import 'package:crud/colourtheme.dart';
import 'package:crud/datapass.dart';
import 'package:crud/edituser.dart';
import 'package:crud/imagepicture.dart';
import 'package:crud/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_authetication/usermodel.dart';
import 'main.dart';

class homepage2 extends StatefulWidget {
  const homepage2({super.key});

  @override
  State<homepage2> createState() => _homepage2State();
}

class _homepage2State extends State<homepage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => adduser(),
              ));
        },
        child: SvgPicture.asset(imagepicture.plus),
        backgroundColor: colourtheme.darkblue,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colourtheme.white,
        title: Text("Hello, User",
            style: TextStyle(
              color: colourtheme.seconderycolor,
              fontWeight: FontWeight.w700,
            )),
        actions: [
          CircleAvatar(
            // radius: w*0.15,
            backgroundImage: AssetImage(imagepicture.men2),
          ),
          SizedBox(
            width: w * 0.03,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signup(),
                    ));
              },
              child: SvgPicture.asset(imagepicture.logout)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.03),
            Text(
              "Current Users",
              style: TextStyle(fontSize: w * 0.07),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Expanded(
              child: Container(
                height: h * 1,
                child: StreamBuilder<List<Usermodel>>(
                    stream:FirebaseFirestore.instance.collection("model").
                    snapshots().map((event) =>event.docs.map((e) => Usermodel.fromMap(e.data())).toList()),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text("No document found"));
                      }
                      var data = snapshot.data!;
                      return data.length == 0
                          ? Center(
                              child: Text(
                              "No users found",
                              style: TextStyle(color: Colors.black87),
                            ))
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => datapass(id: data[index].id.toString()),));
                                  },
                                  child: Container(
                                    height: h * 0.099,
                                    width: w * 0.99,
                                    decoration: BoxDecoration(
                                        color: colourtheme.grey2,
                                        borderRadius:
                                        BorderRadius.circular(w * 0.03)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image(
                                            image:
                                            AssetImage(imagepicture.street)),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: w * 0.03,
                                            ),
                                            SizedBox(height: h * 0.01),
                                            Text(data[index].name.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600)),
                                            SizedBox(height: h * 0.01),
                                            Text(data[index].email.toString(),
                                                style: TextStyle(
                                                    fontSize: w * 0.035)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // SizedBox(width: w*0.01),
                                            InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(w *
                                                                0.03)),
                                                        title: Column(
                                                          children: [
                                                            Text("Are you Sure",
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                  fontSize:
                                                                  w * 0.04,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                                  color: colourtheme
                                                                      .seconderycolor,
                                                                )),
                                                            Text(
                                                                " You Want to delete User ?",
                                                                style: TextStyle(
                                                                  fontSize:
                                                                  w * 0.04,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                                  color: colourtheme
                                                                      .seconderycolor,
                                                                )),
                                                          ],
                                                        ),
                                                        actions: [
                                                          Center(
                                                            child: Column(
                                                              children: [
                                                                Divider(),
                                                                InkWell(
                                                                  onTap: () {
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                        "student")
                                                                        .doc(data[index].email.toString()).delete();Navigator.of(context).pop();
                                                                    },
                                                                  child:
                                                                  Container(
                                                                    width: w * 1,
                                                                    height:
                                                                    w * 0.1,
                                                                    child: Center(
                                                                      child: Text(
                                                                          "Confirm",
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: w *
                                                                                  0.06,
                                                                              fontWeight:
                                                                              FontWeight.w400,
                                                                              color: Colors.blue)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                  Container(
                                                                    width: w * 1,
                                                                    height:
                                                                    w * 0.1,
                                                                    child: Center(
                                                                      child: Text(
                                                                          "Cancel",
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: w *
                                                                                  0.06,
                                                                              fontWeight:
                                                                              FontWeight.w400,
                                                                              color: Colors.red)),
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
                                                child: SvgPicture.asset(
                                                    imagepicture.delete)),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>edituser(
                                                            name: data[index].name.toString(),
                                                            email: data[index].email.toString(),
                                                            password: data[index].password.toString(),
                                                            Confirmpassword: data[index].confirmpassword.toString(), model:data[index],)));
                                              },
                                              child: SvgPicture.asset(
                                                  imagepicture.pen),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox();
                              },
                            );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
