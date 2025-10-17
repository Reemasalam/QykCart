import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qykcart/ShopScreen/Services/productcontroller.dart';
import 'package:qykcart/ShopScreen/Views/ProductCard.dart';
import 'package:qykcart/Src/Appbar.dart';
import 'package:qykcart/Src/Apptext.dart';
import 'package:qykcart/Src/SearchBar.dart';

class ShopProductScreen extends StatefulWidget {
  final String shopId; // 👈 receive shop id from StoreCard
  const ShopProductScreen({super.key, required this.shopId});

  @override
  State<ShopProductScreen> createState() => _ShopProductScreenState();
}

class _ShopProductScreenState extends State<ShopProductScreen> {
  final ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    controller.fetchProducts(widget.shopId); // 👈 Load products for that shop
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              AppAppBar(title: "Shop"),

              const SizedBox(height: 10),

              // 👇 Product list (dynamic)
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.productList.isEmpty) {
                    return const Center(child: Text("No products found"));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.70,
                    ),
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      final product = controller.productList[index];
                      return ProductCard(
                        imageUrl: product.image,
                        title: product.productName,
                        price: product.discountPrice,
                        oldPrice: product.salePrice,
                        weight: "${product.weight} ${product.unit}",
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
