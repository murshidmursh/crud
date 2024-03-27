// import 'package:flutter/material.dart';
//
// import 'app_authetication/cartpage.dart';
// import 'main.dart';
//
// class cart2 extends StatefulWidget {
//   const cart2({super.key});
//
//   @override
//   State<cart2> createState() => _cart2State();
// }
// // List fruits=[
// //   {
// //     "image":"https://st.depositphotos.com/1000141/3111/i/450/depositphotos_31113585-stock-photo-apple-with-slice.jpg",
// //     "name":"apple",
// //     "price":150,
// //     "qty":0,
// //   },
// //   {
// //     "image":"https://www.fervalle.com/wp-content/uploads/2022/07/transparent-orange-apple5eacfeae85ac29.7815306015883956945475.png",
// //   "name":"orenge",
// //   "price":100,
// //   "qty":0,
// //   },
// //   {
// //     "image":"https://images.pexels.com/photos/143133/pexels-photo-143133.jpeg",
// //     "name":"carrot",
// //     "price":100,
// //     "qty":0,
// //   }, {
// //     "image":"https://cdn.mos.cms.futurecdn.net/iC7HBvohbJqExqvbKcV3pP-1200-80.jpg",
// //     "name":"pottato",
// //     "price":150,
// //     "qty":0,
// //   }, {
// //     "image":"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRemk0pOj3avWb06RvabQarkPJ-BUaZPIT9UjLWrwM6xL8TyRbj",
// //     "name":"tomato",
// //     "price":50,
// //     "qty":0,
// //   },
// //
// // ];
//
// class _cart2State extends State<cart2> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//   // int total= 0;
//   // addcast() {
//   //   total=0;
//   //   for (int i = 1; i < fruits.length; i++) {
//   //     total = fruits[i]["price"] * fruits[i]["qty"] + total;
//   //   }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     addcast();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Container(
//         height: h * 0.10,
//         width: w * 1,
//         decoration: BoxDecoration(
//             color: Colors.black87,
//             borderRadius: BorderRadius.circular(w * 0.03)
//         ),
//         child: Center(
//             child: Text("Total: $total", style: TextStyle(color: Colors.white,
//                 fontSize: w * 0.05,
//                 fontWeight: FontWeight.w600
//             ))),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("menu", style: TextStyle(
//             color: Colors.black
//         )),
//       ),
//       body: ListView.builder(
//         itemCount: 5,
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Container(
//                 height: h * 0.15,
//                 width: w * 0.94,
//                 color: Colors.grey,
//                 margin: EdgeInsets.all(w * 0.03),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: h * 0.2,
//                       width: w * 0.2,
//                       child: Image(image: NetworkImage(fruits[index]["image"])),
//                     ),
//                     SizedBox(width: w * 0.06),
//                     SizedBox(height: h * 0.09),
//                     Column(
//                       children: [
//                         Text(fruits[index]["name"]),
//                         Text(fruits[index]["price"].toString()),
//                         Text(fruits[index]["qty"].toString()),
//                       ],
//                     ),
//
//                     InkWell(
//                       onTap: () {
//                         fruits[index]["qty"]++;
//                         addcast();
//                       },
//                     ), fruits[index]["qty"] != 0 ? Container(
//                       height: h * 0.039,
//                       width: w * 0.2,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(w * 0.03),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           InkWell(
//                               onTap: () {
//                                 fruits[index]["qty"]++;
//                                 addcast();
//                               },
//                               child: Icon(Icons.add)),
//                           InkWell(
//                               onTap: () {
//                                 fruits[index]["qty"]++;
//                                 addcast();
//                               },
//                               child: InkWell(
//                                   onTap: () {
//                                     fruits[index]["qty"]--;
//                                     addcast();
//                                   },
//                                   child: Icon(Icons.remove))),
//                         ],
//
//                       ),
//                     ) :
//                     Container(
//                       height: h * 0.039,
//                       width: w * 0.2,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(w * 0.03),
//                         color: Colors.white,
//                       ),
//                       child: Center(child: Text("ADD")),
//
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
