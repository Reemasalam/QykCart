import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const ProductItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title + Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

         SizedBox(width: 15),
          Row(
            children: [
              _squareButton(Icons.remove, const Color(0xff5AC268), onDecrease),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "$quantity",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              _squareButton(Icons.add, const Color(0xff5AC268), onIncrease),
              const SizedBox(width: 6),

              /// Plain delete icon (no square background)
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Reusable square button for + and -
  Widget _squareButton(IconData icon, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 30,
      height: 30,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Small rounded square
          ),
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}
