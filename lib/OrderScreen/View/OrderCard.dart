import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qykcart/Src/Apptext.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String dateTime;
  final String price;
  final String status; // e.g. "Delivery Available"

  const OrderCard({
    super.key,
    required this.orderId,
    required this.customerName,
    required this.dateTime,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row (Order ID + Status)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text:"ORDER ID : $orderId",
                  fontFamily: 'Raleway',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 3),

          /// Customer Name
          AppText(text: 
            customerName,
             fontFamily: 'Raleway',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            
          ),

          const SizedBox(height: 3),

          /// Date & Time + Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text:
                dateTime,
               
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                
              ),
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
