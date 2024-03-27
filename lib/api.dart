import 'dart:convert';

import 'package:crud/colourtheme.dart';
import 'package:crud/imagepicture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}
List apidata=[];
class _apiState extends State<api> {
  getapidata() async {
    Uri? url=Uri.tryParse('https://api.postalpincode.in/pincode/679322');
    http.Response data=await http.get(url!);
    var decodeApi= jsonDecode(data.body);
    apidata= decodeApi;
    setState ((){

    });
  }
  @override
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
        title: Text("Postal Codes",style: TextStyle(
          color: colourtheme.seconderycolor,
          fontWeight: FontWeight.w800,
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.03),
        child: Column(
          children: [
           Text(apidata[0]['PostOffice'][0]['Name']),
            SizedBox(height: h*0.03,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(w*0.03)
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "Enter pincode",
                labelText: "Enter pincode"
              ),
            ),
            SizedBox(height: h*0.02),
           ElevatedButton(onPressed: () {
             getapidata();
           }, child: Text("get")),
            SizedBox(height: h*0.03,),
            Expanded(
              child: Container(
                height: h*1,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(height: h*0.03,);
                  }, separatorBuilder: (BuildContext context, int index) {
                    return  Container(
                      height: h*0.09,
                      width: w*0.96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03),
                          color: colourtheme.grey2
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: h*0.01),
                          Text("Postoffice : ${apidata[0]['PostOffice'][index]['name']}"),
                          Text("Postoffice : ${apidata[0]['PostOffice'][index]['name']}"),
                          SizedBox(height: h*0.01),
                          Text("Pincode : 679322"),
                        ],
                      ),
                    );
                }, itemCount: 8,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
