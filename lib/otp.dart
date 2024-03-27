import 'package:crud/colourtheme.dart';
import 'package:crud/homepage.dart';
import 'package:crud/imagepicture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  backgroundColor: colourtheme.white,
  elevation: 0,
  leading: InkWell(
    onTap: () {
      Navigator.pop(context);
    },
      child: SvgPicture.asset(imagepicture.aaro)),
  title: Text("Verify OTP",style: TextStyle(
    color: colourtheme.seconderycolor
  )),
),
      backgroundColor: colourtheme.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(w*0.03),
          child: Column(
            children: [
              Image(image: AssetImage(imagepicture.otp)),
              SizedBox(height:h*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("OTP has been sent to ",style: TextStyle(
                    color:Colors.grey
                  )),
                  Text("*****634",style: TextStyle(
                    color: colourtheme.darkblue
                  )),
                  SizedBox(width: w*0.03),
                  SvgPicture.asset(imagepicture.pen)
                ],
              ),
              FractionallySizedBox(
                child: Padding(
                  padding:  EdgeInsets.all(w*0.06),
                  child: Pinput(
                    length: 6,
                  ),
                ),
              ),
              SizedBox(height: h*0.01),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(),));
                },
                child: Container(
                  height: h*0.07,
                  width: w*0.59,
                  decoration: BoxDecoration(
                      border: Border.all(color: colourtheme.darkblue),
                      borderRadius: BorderRadius.circular(w*0.09)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: w*0.02),
                      ),
                      Row(
                        children: [
                          Text("Verify",style: TextStyle(
                            color:colourtheme.darkblue,
                            fontWeight: FontWeight.w700
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w*0.02,
                          )
                        ],
                      )
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: h*0.05,
              ),
              Text("Haven't got the confirmation code yet? Resend",style: TextStyle(
                color: colourtheme.darkblue,
                fontSize: w*0.034
              ),),
              SizedBox(height: h*0.09),
              Text("Try Another Method?",style: TextStyle(
                color: colourtheme.darkblue
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
