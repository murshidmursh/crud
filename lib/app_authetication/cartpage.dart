// import 'package:crud/colourtheme.dart';
// import 'package:flutter/material.dart';
//
// import '../main.dart';
//
// class cartpage extends StatefulWidget {
//   //public class
//   const cartpage({super.key});
//
//   @override
//   State<cartpage> createState() => _cartpageState();
// }
// List fruits=[
//   {
//     "image":"https://www.foodandwine.com/thmb/pwFie7NRkq4SXMDJU6QKnUKlaoI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Ultimate-Veggie-Burgers-FT-Recipe-0821-5d7532c53a924a7298d2175cf1d4219f.jpg",
//     "name":"burger",
//     "price": 200,
//     "qty":0
//   },
//   {
//     "image":"https://www.licious.in/blog/wp-content/uploads/2022/02/shutterstock_1339636625.jpg",
//     "name":"shawarma",
//     "price":250,
//     "qty":0
//   },
//   {
//     "image":"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/15-09-26-RalfR-WLC-0098_-_Coca-Cola_glass_bottle_%28Germany%29.jpg/1200px-15-09-26-RalfR-WLC-0098_-_Coca-Cola_glass_bottle_%28Germany%29.jpg",
//     "name":"cola",
//     "price":40,
//     "qty":0
//   },
//   {
//     "image":"https://www.cookclickndevour.com/wp-content/uploads/2017/12/Ghee-rice-recipe-1.jpg",
//     "name":"gheerice",
//     "price":300,
//     "qty":0,
//   },
//   {
//     "image":"https://www.bigbasket.com/media/uploads/p/xxl/40094178_8-7-up-soft-drink.jpg",
//     "name":"7 up",
//     "price":40,
//     "qty":0,
//   },
//   {
//     "image":"https://www.bigbasket.com/media/uploads/p/xxl/40032983_8-sprite-soft-drink.jpg",
//     "name":"sprite",
//     "price":40,
//     "qty":0,
//   },
// ];
// int total=0;class _cartpageState extends State<cartpage> {
 //private class

 //  addcost(){
 //    total=0;
 //    for(int i=0;i<fruits.length;i++){
 //      total  =fruits[i]["price"]*fruits[i]["qty"]+total;
 //    }
 //  }
 //  @override
  // Widget build(BuildContext context) {
//     return Scaffold(
//     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Container(
//         height: h*0.10,
//         width: w*1,
//         decoration: BoxDecoration(
//           color: Colors.black87,
//           borderRadius: BorderRadius.circular(w*0.03)
//         ),
//         child: Center(child: Text("Total: $total",style: TextStyle(color: colourtheme.white,
//           fontSize: w*0.05,
//           fontWeight: FontWeight.w600
//         ))),
//       ),
//       appBar: AppBar(
//         title: Text("Menu",style: TextStyle(
//           color: colourtheme.seconderycolor,
//         )),
//         backgroundColor: colourtheme.white,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: fruits.length,
//               scrollDirection: Axis.vertical,
//               physics: BouncingScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     Container(
//                       height: w*0.25,
//                       width: w*0.94,
//                         margin: EdgeInsets.all(w*0.03),
//                       decoration:BoxDecoration(
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height:w*0.2,
//                               width: w*0.2,
//                               child: Image(image: NetworkImage(fruits[index]["image"]))),
//                           SizedBox(width: w*0.03,),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(fruits[index]["name"]),
//                               Text(fruits[index]["price"].toString()),
//                             ],
//                           ),
//
//                           SizedBox(width: w*0.04,),
//                           fruits[index]["qty"] != 0 ?Container(
//                             height: h*0.039,
//                             width: w*0.2,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(w*0.03),
//                               color: Colors.amberAccent,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 InkWell(
//                                  onTap: () {
//                                    fruits[index]["qty"]++;
//                                    addcost();
//                                    setState(() {
//
//                                    });
//                                  },
//                                     child: Icon(Icons.add)),
//                                 Text(fruits[index]["qty"].toString()),
//                                 InkWell(
//                                   onTap: () {
//                                     fruits[index]["qty"]--;
//                                     addcost();
//                                     setState(() {
//
//                                     });
//                                   },
//                                     child: Icon(Icons.remove)),
//
//                               ],
//                             )
//                           ):InkWell(
//                             onTap: () {
//                               fruits[index]["qty"]++;
//                               addcost();
//                               setState(() {
//
//                               });
//                             },
//                             child: Container(
//                               height: h*0.039,
//                               width: w*0.2,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(w*0.03),
//                                 color: Colors.amberAccent,
//                               ),
//                               child: Center(child: Text("ADD")),
//
//                             ),
//                           )
//
//                         ],
//                       ),
//
//                     )],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
