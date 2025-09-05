import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qykcart/CartScreen/Views/SummaryCard.dart';
import 'package:qykcart/Src/Appbar.dart';
import 'package:qykcart/CartScreen/Views/DeliveryOptionCard.dart';
import 'package:qykcart/Src/AppButton.dart';

class CartOrderScreen extends StatefulWidget {
  const CartOrderScreen({super.key});

  @override
  State<CartOrderScreen> createState() => _CartOrderScreenState();
}

class _CartOrderScreenState extends State<CartOrderScreen> {
  int selectedOption = 1; // 0 = Pickup, 1 = Home Delivery
  DateTime? selectedDate; // 👈 store selected date

  /// Date picker method
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(), // today onwards
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppAppBar(
        title: ("My Cart"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
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

                    SizedBox(height: 24.h),

                    /// Shipping Duration
                    Text(
                      "Shipping Duration",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 12.h),

                    /// Shop Pickup Option
                    DeliveryOptionCard(
                      title: "Shop Pickup",
                      subtitle: "Free",
                      isSelected: selectedOption == 0,
                      onTap: () {
                        setState(() {
                          selectedOption = 0;
                        });
                      },
                    ),

                    /// Home Delivery Option
                    DeliveryOptionCard(
                      title: "Home Delivery",
                      subtitle: "+ \$15.00",
                      isSelected: selectedOption == 1,
                      icon: Icons.local_shipping,
                      onTap: () {
                        setState(() {
                          selectedOption = 1;
                        });
                      },
                    ),

                    SizedBox(height: 20.h),

                    /// Conditional Section
                    if (selectedOption == 1) ...[
                      /// Delivery Address
                      Text(
                        "Delivery Address",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "Enter Address (Address / Locality / Landmark)",
                            hintStyle: GoogleFonts.poppins(fontSize: 14),
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 15.h),

                      /// Contact
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your contact number",
                            hintStyle: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                      ),
                    ] else ...[
                      /// Pack Date (Optional)
                      Text(
                        "Pack Date (Optional)",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8.h),

                      GestureDetector(
                        onTap: _pickDate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  size: 20, color: Colors.black87),
                              const SizedBox(width: 8),
                              Text(
                                selectedDate != null
                                    ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                    : "Select Date",
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),

            /// Bottom Order Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppButton(
                text: "Order Now",
                onPressed: () {
                  // handle order now
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Order Placed Successfully!")),
                  );
                },
                width: 340.w,
                height: 48.h,
                radius: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
