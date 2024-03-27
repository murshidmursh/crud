import 'package:crud/app_authetication/cartpage.dart';
import 'package:flutter/material.dart';

import 'cart2.dart';
import 'main.dart';

class cartpage4 extends StatefulWidget {

  final List cart;
  const cartpage4({super.key,
    required this.cart});

  @override
  State<cartpage4> createState() => _cartpage4State();
}

class _cartpage4State extends State<cartpage4> {
@override
  void initState() {
   print("${widget.cart} mmmmmmm");
  // print("{fruits}nnnnnnnn");
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("cart"),
      ),
body: Column(
  children: [
    Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: widget.cart.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: w*0.3,
            width: w*0.8,
            // margin: EdgeInsets.all(w*0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w*0.03),
              color: Colors.white.withOpacity(0.8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: NetworkImage(widget.cart[index]["image"]),
                  height: w*0.2,
                  width: w*0.25,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.cart[index]["name"],style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),),
                    Text(widget.cart[index]["price"].toString(),style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
                widget.cart[index]["qty"] != 0 ? Container(
                  height: w*0.12,
                  width: w*0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.04),
                      color: Colors.deepPurple
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.cart[index]["qty"].toString(),style: TextStyle(
                          fontWeight: FontWeight.w400,color: Colors.white
                      ),),
                     ]
                  ),
                ) :SizedBox(
                  child: InkWell(
                    onTap: () {

                    },

                  ),
                )],
            ),
          );

      },),
    )
  ],
),
      );

  }
}
