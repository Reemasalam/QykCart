import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qykcart/CartScreen/CartOrderScreen.dart';
import 'package:qykcart/CartScreen/Views/ProductItem.dart';
import 'package:qykcart/CartScreen/Views/SummaryCard.dart';
import 'package:qykcart/Src/Appbar.dart';
import 'package:qykcart/Src/Appbutton.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> quantities = List.filled(10, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Custom App Bar
            const AppAppBar(title: "My Cart"),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Order Summary
                    Text(
                      "Order Summary",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),

                    SummaryCard(
                      summaryData: [
                        {"title": "Total Items", "value": "10 Nos"},
                        {"title": "Items Totals", "value": "100.00 Rs"},
                        {"title": "Shop Charge", "value": "2 Rs"},
                        {"title": "Discounts", "value": "0 Rs"},
                        {
                          "title": "Sub Total",
                          "value": "102.00 Rs",
                          "isBold": true
                        },
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// Products Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Products",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${quantities.length} items",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
/// List of Products with Divider
ListView.separated(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: quantities.length,
  separatorBuilder: (context, index) => const Divider(
    color: Colors.grey,
    thickness: 0.5,
  ),
  itemBuilder: (context, index) {
    return ProductItem(
      title: "Milk 1 Liter / Milma 500 ml",
      subtitle: ".5 Kilogram   26 Rs",
      quantity: quantities[index],
      onIncrease: () {
        setState(() {
          quantities[index]++;
        });
      },
      onDecrease: () {
        setState(() {
          if (quantities[index] > 1) {
            quantities[index]--;
          }
        });
      },
      onDelete: () {
        setState(() {
          quantities.removeAt(index);
        });
      },
    );
  },
),

                  ],
                ),
              ),
            ),

            Center(
              child: AppButton(height: 48.h,width: 340.w,radius: 8,
                text: "Checkout",
                onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CartOrderScreen()));
                },
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
