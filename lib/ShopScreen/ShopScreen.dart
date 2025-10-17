import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qykcart/HomeScreen/Views/StoreCard.dart';
import 'package:qykcart/ShopScreen/Services/shopcontroller.dart';
import 'package:qykcart/Src/Appbar.dart';
import 'package:qykcart/Src/SearchBar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ShopController controller = Get.put(ShopController());

  @override
  void initState() {
    super.initState();
    controller.fetchShops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppAppBar(title: "Shops"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const AppSearchBar(hintText: "Search Category"),
            const SizedBox(height: 17),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.shopList.isEmpty) {
                  return const Center(child: Text("No shops available"));
                }
                return ListView.builder(
                  itemCount: controller.shopList.length,
                  itemBuilder: (context, index) {
                    final shop = controller.shopList[index];
                    return StoreCard(
                      id: shop.id,
                      name: shop.shopName,
                      category: "Grocery Shop",
                      location: "${shop.city}, ${shop.state}",
                      imagePath: shop.shopImage,
                      deliveryAvailable: shop.isDeliveryAvailable,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
