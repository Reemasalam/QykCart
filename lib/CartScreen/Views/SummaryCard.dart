import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryCard extends StatelessWidget {
  final List<Map<String, dynamic>> summaryData;

  const SummaryCard({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 251, 251),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          for (int i = 0; i < summaryData.length; i++) ...[
            if (summaryData[i]['isBold'] == true) const Divider(thickness: 1,color: Colors.black,),
            _summaryRow(
              summaryData[i]['title'],
              summaryData[i]['value'],
              isBold: summaryData[i]['isBold'] ?? false,
            ),
          ],
        ],
      ),
    );
  }

  Widget _summaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
