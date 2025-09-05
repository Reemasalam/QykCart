import 'package:flutter/material.dart';
import 'package:qykcart/OrderScreen/OrderDetailScreen.dart';
import 'package:qykcart/OrderScreen/View/OrderCard.dart';
import 'package:qykcart/Src/Appbar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
    appBar: AppAppBar(title: "My Orders"),
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
        GestureDetector(onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderDetailScreen()));},
          child: OrderCard(
          orderId: "129241",
          customerName: "Reghu Pedika Kozhikod",
          dateTime: "29 - March - 2025 | 12 : 30 am",
          price: "205:00 Rs",
          status: "Delivery Available",
                ),
        ),OrderCard(
        orderId: "129241",
        customerName: "Reghu Pedika Kozhikod",
        dateTime: "29 - March - 2025 | 12 : 30 am",
        price: "205:00 Rs",
        status: "Delivery Available",
      ),OrderCard(
        orderId: "129241",
        customerName: "Reghu Pedika Kozhikod",
        dateTime: "29 - March - 2025 | 12 : 30 am",
        price: "205:00 Rs",
        status: "Delivery Available",
      )
      ]
      
      ),
    )),);
  }
}