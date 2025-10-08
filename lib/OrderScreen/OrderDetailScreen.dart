import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qykcart/OrderScreen/View/ItemNoCard.dart';
import 'package:qykcart/OrderScreen/View/OrderDetailCard.dart';
import 'package:qykcart/Src/Appbar.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // Example product list
    final products = [
      {
        "title": "Milk 1 Liter / Milma 500 ml",
        "subtitle": ".5 Kilogram   26 Rs",
        "quantity": 20
      },
      {
        "title": "Milk 1 Liter / Milma 500 ml",
        "subtitle": ".5 Kilogram   26 Rs",
        "quantity": 5
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppAppBar(title: "Order Details"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetailCard(
                orderId: "039936200",
                recipientName: "Dexter Morgan",
                address: "Jalan By Pass Ngurah Rai, Denpasar, Bali, 80228",
                date: "April 4th 2024",
                deliveryMethod: "BCA Virtual Account",
                totalAmount: "\$73.90",
                creditAmount: "\$73.90",
                paidAmount: "\$73.90",
                status: "Completed",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${products.length} items",
                    style: GoogleFonts.poppins(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Products with Divider
              Column(
                children: List.generate(products.length, (index) {
                  final product = products[index];
                  return Column(
                    children: [
                      ProductItemNo(
                      title: "Milk 1 Liter / Milma 500 ml",
        subtitle: ".5 Kilogram   26 Rs",
                        quantity: product["quantity"] as int,
                        onIncrease: () {},
                        onDecrease: () {},
                        onDelete: () {},
                      ),
                      if (index != products.length - 1)
                        const Divider(color: Colors.grey, height: 20),
                    ],
                  );
                }),
              ),

              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Rebook action
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5AC268),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Re Book",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
