import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qykcart/ShopScreen/Views/ProductCard.dart';
import 'package:qykcart/Src/AppBottombar.dart';
import 'package:qykcart/Src/Appbar.dart';
import 'package:qykcart/Src/Apptext.dart';
import 'package:qykcart/Src/SearchBar.dart';

class ShopProductScreen extends StatefulWidget {
  const ShopProductScreen({super.key});

  @override
  State<ShopProductScreen> createState() => _ShopProductScreenState();
}

class _ShopProductScreenState extends State<ShopProductScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppAppBar(title: "Shop"),
          
              // Shop info
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0),
               child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Shop name + Call button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text:"Kutti Kada",fontFamily: "Raleway",
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff23AA49),
                            
                          ),
                         IconButton(
                 onPressed: () {
                   // later you can add call functionality here with url_launcher
                 },
                 icon: const Icon(
                   Icons.phone,
                   color: Colors.green,
                   size: 22,
                 ),
               
                 
               ),
               
                        ],
                      ),
               
                      // Address + Delivery available
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                             text: "Karuvatta | Haripad | Kerala",
                                fontFamily: 'Railway',
                                fontSize: 12,
                                color: Colors.black,
                            ),
                          
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff5AC268),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            child: AppText(
                             text: "Delivery Available",
                                fontFamily: 'Railway',
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            
                          ),
                        ],
                      ),
                    ],
                  ),
             ),
              
          
              const SizedBox(height: 10),
          
              Padding(
                padding: const EdgeInsets.all( 12.0),
                child: AppSearchBar(hintText: "Search Category",),
              ),
          
              const SizedBox(height: 10),
          
              // Product Grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.70,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      imageUrl:"assets/milk.png",
                      title: "Milk 1 Liter / Milma 500 ml",
                      price: 2324.00,
                      oldPrice: 2344.00,
                      weight: "10 Kilogram",
                     
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
