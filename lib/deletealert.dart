import 'package:crud/colourtheme.dart';
import 'package:crud/imagepicture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class deletealert extends StatefulWidget {
  const deletealert({super.key});

  @override
  State<deletealert> createState() => _deletealertState();
}

class _deletealertState extends State<deletealert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
      },
        child: SvgPicture.asset(imagepicture.plus),
        backgroundColor: colourtheme.darkblue,

      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colourtheme.white,
        title: Text("Hello, User",style: TextStyle(
          color: colourtheme.seconderycolor,
          fontWeight: FontWeight.w700,
        )),
        actions: [
          CircleAvatar(
            // radius: w*0.15,
            backgroundImage:AssetImage(imagepicture.men2),
          ),
          SizedBox(width: w*0.03,),
          SvgPicture.asset(imagepicture.logout),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h*0.03),
          Text("Current Users",style: TextStyle(
              fontSize: w*0.07
          ),),
          SizedBox(height: h*0.03,),

          Expanded(
            child: Container(
              height: h*1,
              child: ListView.separated(

                itemBuilder: (context, index) {
                  return SizedBox(height: h*0.03,);
                },
                itemCount: 8, separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: h*0.099,
                  width: w*0.99,
                  decoration: BoxDecoration(
                      color: colourtheme.grey2,
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  child: Row(
                    children: [
                      Image(image: AssetImage(imagepicture.street)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: w*0.03,),
                          SizedBox(height: h*0.01),
                          Row(
                            children: [

                              Text("Albert Flores",style: TextStyle(
                                  fontWeight: FontWeight.w600
                              )),
                            ],

                          ),
                          SizedBox(height: h*0.01),
                          Text("1901 Thornridge Cir. Shiloh, Hawaii"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: w*0.03,),
                          SvgPicture.asset(imagepicture.delete),
                          SvgPicture.asset(imagepicture.pen),
                        ],
                      )
                    ],
                  ),
                );
              },),
            ),
          )
        ],
      ),

    );
  }
}
