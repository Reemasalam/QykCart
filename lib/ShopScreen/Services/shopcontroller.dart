import 'package:get/get.dart';
import 'package:qykcart/ShopScreen/Models/productmodel.dart';
import 'package:qykcart/ShopScreen/Models/shopmodel.dart';
import 'package:qykcart/Utils/ApiService.dart';

class ShopController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ShopModel> shopList = <ShopModel>[].obs;
  RxList<ProductModel> productList = <ProductModel>[].obs;

  /// Fetch all shops
  Future<void> fetchShops() async {
    isLoading.value = true;

    await ApiService.request(
      endpoint: "/api/v1/shops/active",
      method: Api.GET,
      requiresAuth: true,
      onSuccess: (response) {
        isLoading.value = false;
        final List data = response.data?? [];
        shopList.value = data.map((e) => ShopModel.fromJson(e)).toList();
      },
      onError: (error) {
        isLoading.value = false;
        Get.snackbar("Error", "Failed to load shops: $error");
      },
    );
  }
}
 