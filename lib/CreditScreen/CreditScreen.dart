import 'package:flutter/material.dart';
import 'package:qykcart/HomeScreen/Views/StoreCard.dart';
import 'package:qykcart/OrderScreen/View/OrderCard.dart';
import 'package:qykcart/Src/Appbar.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({super.key});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(backgroundColor: Colors.white,
    appBar: AppAppBar(title: "My Credits"),
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
        StoreCard(
          id: '',
              name: "Gouri Stores",
              category: "Grocery Shop | Fancy",
              location: "Karuvatta | Haripad | Kerala",
              imagePath: "assets/store1.png",
              deliveryAvailable: true, 
            ),],
      
      ),
    )),),);
  }
}