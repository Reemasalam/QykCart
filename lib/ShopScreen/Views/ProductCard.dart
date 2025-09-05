import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final String weight;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.weight,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
           Expanded(
  child: Center(
    child: Image.asset(
      widget.imageUrl,       // 👈 make sure this is an asset path like "assets/images/milk.png"
      fit: BoxFit.contain,
    ),
  ),
),

            const SizedBox(height: 6),

            // Title
            Text(
              widget.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),

            // Price row
            Row(
              children: [
                Text(
                  "\$${widget.price.toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "\$${widget.oldPrice.toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),

            // Weight + Add/Qty controls in same row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.weight,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),

                // Add or qty buttons
                quantity == 0
                    ? ElevatedButton(
  onPressed: () {
    setState(() {
      quantity = 1;
    });
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xff5AC268),
    minimumSize: const Size(55, 26), // 👈 small width & height
    padding: EdgeInsets.zero,        // remove extra padding
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), // match tiny containers
    ),
  ),
  child: Text(
    "Add",
    style: GoogleFonts.poppins(
      fontSize: 11,        // smaller font
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
)



                      
                     : Row(
  children: [
    // - button (tiny)
    Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.remove, size: 14, color: Colors.white),
        onPressed: () {
          setState(() {
            if (quantity > 1) {
              quantity--;
            } else {
              quantity = 0;
            }
          });
        },
      ),
    ),
    const SizedBox(width: 3),

    // qty box (tiny)
    Container(
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "$quantity",
        style: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    const SizedBox(width: 3),

    // + button (tiny)
    Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.add, size: 14, color: Colors.white),
        onPressed: () {
          setState(() {
            quantity++;
          });
        },
      ),
    ),
  ],
),



              ],
            ),
          ],
        ),
      ),
    );
  }
}
