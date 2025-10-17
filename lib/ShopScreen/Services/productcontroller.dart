import 'package:get/get.dart';
import 'package:qykcart/ShopScreen/Models/productmodel.dart';
import 'package:qykcart/Utils/ApiService.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var productList = <ProductModel>[].obs;

  // Fetch products for a specific shop
  Future<void> fetchProducts(String shopId) async {
  isLoading.value = true;

  await ApiService.request(
    endpoint: "/api/v1/products/shop/$shopId",
    method: Api.GET,
    requiresAuth: true,
    onSuccess: (response) {
      isLoading.value = false;
      final List data = response.data ?? [];
      productList.value = data.map((e) => ProductModel.fromJson(e)).toList();
    },
    onError: (error) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to load products: $error");
    },
  );
}

}
 