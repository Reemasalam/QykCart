
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qykcart/CartScreen/CartScreen.dart';
import 'package:qykcart/CreditScreen/CreditScreen.dart';
import 'package:qykcart/HomeScreen/Views/OfferBanner.dart';
import 'package:qykcart/HomeScreen/Views/QuickactionCard.dart';
import 'package:qykcart/HomeScreen/Views/StoreCard.dart';
import 'package:qykcart/OrderScreen/OrderScreen.dart';
import 'package:qykcart/ProfileScreen/ProfileScreen.dart';
import 'package:qykcart/ShopScreen/ShopScreen.dart';
import 'package:qykcart/Src/AppBottombar.dart';
import 'package:qykcart/Src/Appbar.dart';
import 'package:qykcart/Src/Apptext.dart';
import 'package:qykcart/Src/SearchBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    ShopScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: AppBottomBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

/// 🏠 Home Tab
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
      
        title: 
          "QykCart",
         
          
        ),
       
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSearchBar(hintText: "Search Products"),
            SizedBox(height: 17.h),

            // Horizontal banners
            SizedBox(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(
                    width: 320,
                    child: OfferBanner(
                      title: "Ramadan Offers",
                      discount: "Get 25%",
                      subtitle: "Grab Offer",
                      imagePath: "assets/banner_food.png",
                    ),
                  ),
                  SizedBox(width: 12),
                  SizedBox(
                    width: 342,
                    child: OfferBanner(
                      title: "Weekend Deals",
                      discount: "Save 40%",
                      subtitle: "Shop Now",
                      imagePath: "assets/banner_food.png",
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 19.h),
            const AppText(
              text: "Quick Action",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Raleway",
            ),
            const SizedBox(height: 8),

            Row(
  children: [
    Expanded(
      child: QuickActionCard(
        imagePath: "assets/icon.png",
        title: "My Order",
        subtitle: "View your orders",
        borderColor: const Color(0xff8DC59D),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrderScreen()),
          );
        },
      ),
    ),
    const SizedBox(width: 12),
    Expanded(
      child: QuickActionCard(
        imagePath: "assets/icon.png",
        title: "My Credits",
        subtitle: "Pending credits",
        borderColor: const Color(0xffE1E390),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreditScreen()),
          );
        },
      ),
    ),
  ],
),


            const SizedBox(height: 20),
            const AppText(
              text: "Near By Store",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Railway",
            ),
            const SizedBox(height: 8),

            StoreCard(
              name: "Gouri Stores",
              category: "Grocery Shop | Fancy",
              location: "Karuvatta | Haripad | Kerala",
              imagePath: "assets/store1.png",
              deliveryAvailable: true,
            ),
            StoreCard(
              name: "Reemus Stores",
              category: "Grocery Shop | Fancy",
              location: "Tirur | Malappuram | Kerala",
              imagePath: "assets/store2.png",
              deliveryAvailable: true,
            ),
             Row(
            children: [
              Expanded(
                child: AppText(
                  text:
                      "Late night needs? Our Delivery \n Partners have you covered all night.",
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "Inter",
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                "assets/time.png",
                width: 120,
                height: 100,
                fit: BoxFit.contain,
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
