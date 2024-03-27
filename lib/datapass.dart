import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class datapass extends StatefulWidget {
  final String id;
  const datapass({super.key,
    required this.id});

  @override
  State<datapass> createState() => _datapassState();
 
}

class _datapassState extends State<datapass> {
  List datapass=[];
  Map<String,dynamic>shib={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Data Pass"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(w*0.04),
          child: Column(
            children: [
             InkWell(
               onTap: () async {
              // QuerySnapshot<Map<String,dynamic>>data =await FirebaseFirestore.instance.collection("user").get();
              //    datapass=data.docs;

                DocumentSnapshot<Map<String,dynamic>> data2 =await FirebaseFirestore.instance.collection("student").doc(widget.id).get();
                print(widget.id);
                 shib=data2.data()??{};
                 setState(() {

                 });
               },
               child: Center(
                 child: Container(
                   height: h*0.1,
                   width: w*0.2,
                   color: Colors.blue,
                   child: Center(child: Text("Get",
                   style: TextStyle(
                     color: Colors.white
                   ),)),
                 ),
               ),
             ),
              // ListView.builder(
              //   physics: BouncingScrollPhysics(),
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   itemCount: datapass.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: h*0.2,
              //         width: w*0.8,
              //         margin: EdgeInsets.only(bottom: w*0.03),
              //         color: Colors.blue,
              //         child: Column(
              //           children: [
              //             Text(datapass[index]["name"]),
              //             Text(datapass[index]["email"]),
              //             Text(datapass[index]["password"]),
              //             Text(datapass[index]["confirmPassword"]),
              //
              //           ],
              //         ),
              //       );
              //     },
              // )
              Container(
                height: h*0.2,
                width: w*0.8,
                child: Column(
                  children: [
                    Text(shib["name"] ?? ""),
                    Text(shib["email"] ?? ""),
                    Text(shib["password"]?? ""),
                    Text(shib["confirmPassword"]?? ""),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
