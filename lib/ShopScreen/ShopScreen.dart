import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qykcart/HomeScreen/Views/StoreCard.dart';
import 'package:qykcart/Src/Appbar.dart';
import 'package:qykcart/Src/SearchBar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppAppBar(title:"Shops"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSearchBar(hintText: "Search Category",),
            SizedBox(height: 17.h),
            StoreCard(
              name: "Gouri Stores",
              category: "Grocery Shop | Fancy",
              location: "Karuvatta | Haripad | Kerala",
              imagePath: "assets/store1.png",
              deliveryAvailable: true,
            ),
            StoreCard(
              name: "Reemus Stores",
              category: "Grocery Shop | Fancy",
              location: "Tirur | Malappuram | Kerala",
              imagePath: "assets/store2.png",
              deliveryAvailable: true,
            ),
            StoreCard(
              name: "Nayana Fancy Stores",
              category: "Grocery Shop | Fancy",
              location: "Tirur | Malappuram | Kerala",
              imagePath: "assets/store3.png",
              deliveryAvailable: true,
            ),
            StoreCard(
              name: "Kutti Kada",
              category: "Grocery Shop | Fancy",
              location: "Kidanghoor| Chagnasheery| Kerala",
              imagePath: "assets/store4.png",
              deliveryAvailable: true,
            ),
            ],),),);

  }
}