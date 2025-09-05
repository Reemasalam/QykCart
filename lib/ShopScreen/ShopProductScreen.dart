import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qykcart/ShopScreen/Views/ProductCard.dart';
import 'package:qykcart/Src/AppBottombar.dart';
import 'package:qykcart/Src/Appbar.dart';

class ShopProductScreen extends StatefulWidget {
  const ShopProductScreen({super.key});

  @override
  State<ShopProductScreen> createState() => _ShopProductScreenState();
}

class _ShopProductScreenState extends State<ShopProductScreen> {
  int _selectedIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/HomeScreen');
        break;
      case 1:
        // Already on Shops
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/CartScreen');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/ProfileScreen');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: AppBottomBar(
        selectedIndex: _selectedIndex,
        onTap: _onTap,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppAppBar(title: "Shop"),

            // Shop info
           Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Shop name + Call button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kutti Kada",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                     IconButton(
  onPressed: () {
    // later you can add call functionality here with url_launcher
  },
  icon: const Icon(
    Icons.phone,
    color: Colors.green,
    size: 22,
  ),

  
),

                    ],
                  ),

                  const SizedBox(height: 6),

                  // Address + Delivery available
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Karuvatta | Haripad | Kerala",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Text(
                          "Delivery Available",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            

            const SizedBox(height: 10),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search category",
                    prefixIcon: const Icon(Icons.search, color: Colors.green),
                    hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Product Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.70,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: index % 2 == 0
                        ? "https://www.milma.com/uploads/products/2021/09/500-ml-milma-pouch-1631614989.jpg"
                        : "https://m.media-amazon.com/images/I/81xEjbPpBqL.jpg",
                    title: "Milk 1 Liter / Milma 500 ml",
                    price: 2324.00,
                    oldPrice: 2344.00,
                    weight: "10 Kilogram",
                    isAdded: index == 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
