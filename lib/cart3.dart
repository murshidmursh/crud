import 'package:crud/app_authetication/cartpage.dart';
import 'package:crud/cartpage4.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class cart3 extends StatefulWidget {
  const cart3({super.key});

  @override
  State<cart3> createState() => _cart3State();
}

class _cart3State extends State<cart3> {
  // List menu = [
  //   {
  //     "image": "https://bonmasala.com/wp-content/uploads/2022/10/mutton-biriyani-recipe.jpeg",
  //     "name": "Biriyani",
  //     "price": 160,
  //     "qty": 0
  //   },
  //   {
  //     "image": "https://images.aws.nestle.recipes/resized/52007da8aee0c1d4cdb98e2e5c9b03cd_Maggi_-_Easy_Creamy_Chicken_Pasta_1080_850.jpg",
  //     "name": "Pasta",
  //     "price":  180,
  //     "qty": 0
  //   },
  //   {
  //     "image": "https://cdn1.foodviva.com/static-content/food-images/rice-recipes/ghee-rice-recipe/ghee-rice-recipe.jpg",
  //     "name": "Ghee Rice",
  //     "price": 110,
  //     "qty": 0
  //   },
  //   {
  //     "image": "https://www.licious.in/blog/wp-content/uploads/2023/01/shutterstock_1546959563.jpg",
  //     "name": "Noodles",
  //     "price": 100,
  //     "qty": 0
  //   },
  //   {
  //     "image": "https://i.ytimg.com/vi/HVi7xxQZDRQ/maxresdefault.jpg",
  //     "name": "Al Fahm",
  //     "price": 190,
  //     "qty": 0
  //   },
  //   {
  //     "image": "https://tapcom-live.ams3.cdn.digitaloceanspaces.com/media/shawaya-bros/products/652652-Full_Shawaya_French_Fries_Meal_22159.jpg",
  //     "name": "Shawaya",
  //     "price": 160,
  //     "qty": 0
  //   },
  //   {
  //     "image": "https://th-i.thgim.com/public/incoming/wm82bf/article67226291.ece/alternates/FREE_1200/Kappa%20Chakka%20Kandhari_Onam%20Sadya%20photo%20courtesy%20Balakrishnan-1.jpg",
  //     "name": "Sadya",
  //     "price": 200,
  //     "qty": 0
  //   }
  // ];
  List fruits=[
{
"image":"https://st.depositphotos.com/1000141/3111/i/450/depositphotos_31113585-stock-photo-apple-with-slice.jpg",
"name":"apple",
    "price":150,
    "qty":0,
  },
  {
    "image":"https://www.fervalle.com/wp-content/uploads/2022/07/transparent-orange-apple5eacfeae85ac29.7815306015883956945475.png",
  "name":"orange",
  "price":100,
  "qty":0,
  },
  {
    "image":"https://images.pexels.com/photos/143133/pexels-photo-143133.jpeg",
    "name":"carrot",
    "price":200,
    "qty":0,
  }, {
    "image":"https://cdn.mos.cms.futurecdn.net/iC7HBvohbJqExqvbKcV3pP-1200-80.jpg",
    "name":"pottato",
    "price":150,
    "qty":0,
  }, {
    "image":"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRemk0pOj3avWb06RvabQarkPJ-BUaZPIT9UjLWrwM6xL8TyRbj",
    "name":"tomato",
    "price":200,
    "qty":0,
  },

];
  List cart=[];
  List save=[];
  int total=0;
  getTotal(){
    total=0;
    for(int i=0; i<fruits.length; i++){
      total=fruits[i]["price"]*fruits[i]["qty"]+total;

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54.withOpacity(0.7),

      floatingActionButton: Container(
        height: w*0.13,
        width: w*1,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w*0.04),
              topRight: Radius.circular(w*0.04),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("TOTAL : $total",style: TextStyle(
                fontWeight: FontWeight.w600
            ),),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>cartpage4(
                  cart: cart.toList(),
                    ) ,));
                print(cart);
                setState(() {
                  print(cart);

                });
              },
              child: Container(
                height: h*0.1,
                width: w*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.03),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text("Submit",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  )),
                ),
              ),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("MENU",style: TextStyle(
                fontWeight: FontWeight.w700,color: Colors.black
            ),),
            SizedBox(width: w*0.01),
            Icon(Icons.list,color: Colors.black,)
          ],
        ),
        backgroundColor: Colors.white54.withOpacity(0.7),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // if(cart.contains(fruits[index])){
                    //   cart.add(index);
                    // }
                    // else{
                    //   cart.add(fruits[index]);
                    //     save.add(fruits[index]);
                    // }
                    // if(save.contains(index)){
                    //   cart.add({
                    //     "image":fruits[index]["image"],
                    //     "name":fruits[index]["name"],
                    //     "price":fruits[index]["price"],
                    //     "qty":fruits[index]["qty"],
                    //   });
                    //  }
                    // Check if the cart contains the current item
                    if (cart.contains(fruits[index])) {
                      // If it does, increase the quantity
                      // fruits[index]["qty"]++;
                    } else {
                      // If it doesn't, add the item to the cart
                      cart.add(fruits[index]);
                    }
                    // Recalculate total price and update the UI
                    getTotal();
                    setState(() {});
                  },
                  child: Container(
                    height: w*0.3,
                    width: w*0.8,
                    margin: EdgeInsets.all(w*0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03),
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(image: NetworkImage(fruits[index]["image"]),
                          height: w*0.2,
                          width: w*0.25,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(fruits[index]["name"].toString(),style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),),
                            Text(fruits[index]["price"].toString(),style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                        fruits[index]["qty"].toString() != 0 ? Container(
                          height: w*0.12,
                          width: w*0.22,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.04),
                              color: Colors.deepPurple
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    fruits[index]["qty"]>0?fruits[index]["qty"]--:0;
                                    getTotal();
                                    setState(() {

                                    });
                                  },
                                  child: Icon(Icons.remove,color: Colors.white,)),
                              Text(fruits[index]["qty"].toString(),style: TextStyle(
                                  fontWeight: FontWeight.w400,color: Colors.white
                              ),),
                              InkWell(
                                  onTap: () {
                                    fruits[index]["qty"]++;
                                    getTotal();
                                    setState(() {

                                    });
                                  },
                                  child: Icon(Icons.add,color: Colors.white,)),
                            ],
                          ),
                        ) :InkWell(
                          onTap: () {
                            fruits[index]["qty"]++;
                            getTotal();
                            setState(() {

                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: w*0.12,
                                width: w*0.22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w*0.04),
                                    color: Colors.deepPurple
                                ),
                                child: Center(
                                  child: Text("ADD",style: TextStyle(
                                      color: Colors.white,fontWeight: FontWeight.w600
                                  ),),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },),
          )
        ],
      ),
    );
  }
}


