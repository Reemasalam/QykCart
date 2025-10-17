import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qykcart/ShopScreen/ShopProductScreen.dart';

class StoreCard extends StatelessWidget {
  final String id;
  final String name;
  final String category;
  final String location;
  final String imagePath;
  final bool deliveryAvailable;

  const StoreCard({
    super.key,
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.imagePath,
    this.deliveryAvailable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
  Get.to(() => ShopProductScreen(shopId: id));
},

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                width: 100,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category,
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            location,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (deliveryAvailable)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              "Delivery Available",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
