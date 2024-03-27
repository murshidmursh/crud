import 'package:crud/colourtheme.dart';
import 'package:crud/imagepicture.dart';
import 'package:crud/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'main.dart';

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: colourtheme.white,
       leading: InkWell(
         onTap: () {
           Navigator.pop(context);
         },
           child: SvgPicture.asset(imagepicture.aaro)),
        title: Text("Enter Phone Number",style: TextStyle(
          color: colourtheme.seconderycolor
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h*0.01),
              Image(image: AssetImage(imagepicture.img)),
              SizedBox(height: h*0.05),
              SizedBox(width: w*0.01),
              Container(
                width: w*0.95,
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w*0.03),
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
              SizedBox(height: h*0.01),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => otp(),));
                },
                child: Container(
                  height: h*0.07,
                  width: w*0.55,
                  decoration: BoxDecoration(
                      border: Border.all(color: colourtheme.darkblue),
                      borderRadius: BorderRadius.circular(w*0.06)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: w*0.05),
                          Text("Send OTP",style: TextStyle(
                            color:colourtheme.darkblue,
                            fontWeight: FontWeight.w600
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w*0.05,
                          )
                        ],
                      )
                    ],
                  ),

                ),
              ),
              SizedBox(height: h*0.18),
              Text("Sign in with Another Method ?",style: TextStyle(
                color: colourtheme.darkblue
              ),)

            ],
          ),
        ),
      ),
    );
  }
}
