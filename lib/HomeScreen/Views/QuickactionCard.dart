import 'package:flutter/material.dart';

class QuickActionCard extends StatelessWidget {
  final String imagePath;   // 👈 for image
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color borderColor;  // 👈 custom border color

  const QuickActionCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.borderColor = const Color(0xFFB2DFDB), // default light green
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // Image instead of icon
            Image.asset(
              imagePath,
              height: 31,
              width: 31,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),

            // Title + Subtitle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,fontFamily: "Raleway"
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500,fontFamily: "Raleway"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
