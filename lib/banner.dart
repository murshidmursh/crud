import 'package:crud/colourtheme.dart';
import 'package:crud/imagepicture.dart';
import 'package:crud/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class banner extends StatefulWidget {
  const banner({super.key});

  @override
  State<banner> createState() => _bannerState();
}

class _bannerState extends State<banner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colourtheme.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: SvgPicture.asset(imagepicture.aaro)),
        title: Text("Banner",style: TextStyle(
          fontWeight: FontWeight.w600,
          color: colourtheme.seconderycolor
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: w*0.04),
            SizedBox(height: h*0.01),
            Center(child: Image(image: AssetImage(imagepicture.plus2))),
            Column(
              children: [
                 SizedBox(height: h*0.01),
                Padding(
                  padding:  EdgeInsets.all(w*0.07),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.03)
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Banner",
                        labelText: "Title"
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => otp(),));
                  },
                  child: Container(
                    height: h*0.09,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: colourtheme.darkblue),
                      borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    child: Center(
                      child: Text("Upload Banner",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: w*0.05,
                        color: colourtheme.darkblue

                      )),
                    ),
                  ),
                ),
                SizedBox(height: h*0.02),
                Container(
                  height: h*0.14,
                  width: w*0.9,
                  decoration: BoxDecoration(
                      color: colourtheme.white,
                    borderRadius: BorderRadius.circular(w*0.03),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.15),
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset:Offset(0,4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(w*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            SizedBox(height: h*0.02),
                            Image(image: AssetImage(imagepicture.plus3)),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: h*0.01,),
                            SizedBox(width: w*0.04,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Banner 1',style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.05
                                ),),
                                SizedBox(height: h*0.02),
                                Text("2 May"),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(width: w*0.095),
                        SvgPicture.asset(imagepicture.delete)
                      ],
                    ),
                  ),

                ),
                SizedBox(height: h*0.02),
                Container(
                  height: h*0.14,
                  width: w*0.9,
                  decoration: BoxDecoration(
                      color: colourtheme.white,
                    borderRadius: BorderRadius.circular(w*0.03),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.15),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset:Offset(0,4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(w*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            SizedBox(height: h*0.02),
                            Image(image: AssetImage(imagepicture.plus4)),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: h*0.01,),
                            SizedBox(width: w*0.04,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Banner 2',style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.05
                                ),),
                                SizedBox(height: h*0.02),
                                Text("2 May"),
                              ],
                            ),
                           SizedBox(width:w*0.04),
                          ],
                        ),
                        SizedBox(width: w*0.095),
                        SvgPicture.asset(imagepicture.delete)
                      ],
                    ),
                  ),

                ),
                SizedBox(height: h*0.02),
                Container(
                  height: h*0.14,
                  width: w*0.9,
                  decoration: BoxDecoration(
                      color: colourtheme.white,
                    borderRadius: BorderRadius.circular(w*0.03),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.15),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset:Offset(0,4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(w*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            SizedBox(height: h*0.02),
                            Image(image: AssetImage(imagepicture.plus3)),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: h*0.01,),
                            SizedBox(width: w*0.04,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Banner 3',style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.05
                                ),),
                                SizedBox(height: h*0.02),
                                Text("2 May"),
                              ],
                            ),
                            SizedBox(width: w*0.04,),

                          ],
                        ),
                        SizedBox(width: w*0.1),
                        SvgPicture.asset(imagepicture.delete)
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    
    );
  }
}
