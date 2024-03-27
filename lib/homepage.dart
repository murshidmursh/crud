import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud/api.dart';
import 'package:crud/app_authetication/login.dart';
import 'package:crud/app_authetication/signup.dart';
import 'package:crud/banner.dart';
import 'package:crud/colourtheme.dart';
import 'package:crud/homepage2.dart';
import 'package:crud/imagepicture.dart';
import 'package:crud/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int currentindex=0;
  List Group = [
    imagepicture.group1,
    imagepicture.group2,
    imagepicture.group3,
  ];

  String? name="";
  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username= prefs.getString("name") ?? "User";
    setState(() {

    });
  }

  @override
  void initState() {
    getName();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colourtheme.white,
        title: Text("Hello, $username",style: TextStyle(
          color: colourtheme.seconderycolor,
              fontWeight: FontWeight.w700,
        )),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => profile(),));
            },
            child: CircleAvatar(
              // radius: w*0.15,
              backgroundImage:AssetImage(imagepicture.men2),
            ),
          ),
          SizedBox(width: w*0.03,),
          InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('login');
              prefs.clear();
              GoogleSignIn().signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
            },
              child: SvgPicture.asset(imagepicture.logout)),
        ],
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: h*0.04),
            CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentindex = index;
                  });
                },
              ),
              itemCount: Group.length,
              itemBuilder:
                  (BuildContext context, int index, int realIndex) {
                return Container(
                  width: w * 0.9,
                  height: w * 0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Group[index]),
                        fit: BoxFit.fill),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: w * 0.04),
            AnimatedSmoothIndicator(
                activeIndex: currentindex, count: Group.length),
            SizedBox(height: h*0.03),
            Padding(
              padding:  EdgeInsets.all(w*0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => homepage2(),));
                       }, 
                        child: Container(
                          height: h*0.20,
                          width: w*0.35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87.withOpacity(0.15),
                                  spreadRadius: 7,
                                  blurRadius: 10,
                                  offset:Offset(0,4),
                                )
                              ],
                            borderRadius: BorderRadius.circular(w*0.09)
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage(imagepicture.flower)),
                              Text("CRUD",style: TextStyle(
                                fontSize: w*0.07
                              ),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: w*0.14),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => banner(),));
                        },
                        child: Container(
                          height: h*0.20,
                          width: w*0.35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black87.withOpacity(0.15),
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset:Offset(0,4),
                              )
                            ],
                              borderRadius: BorderRadius.circular(w*0.09),
                          ),
                          child: Image(image: AssetImage(imagepicture.flower2)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: h*0.03),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => api(),));
                    },
                    child: Container(
                      height: h*0.23,
                      width: w*0.35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.15),
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset:Offset(0,4),
                          )
                        ],
                        borderRadius: BorderRadius.circular(w*0.09),
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage(imagepicture.flower3)),
                          Text("API",style: TextStyle(
                            fontSize: w*0.03
                          ),)
                        ],
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
    );
  }
}
