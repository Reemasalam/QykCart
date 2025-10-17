class ShopModel {
  final String id;
  final String shopName;
  final String fullAddress;
  final String city;
  final String state;
  final String shopImage;
  final bool isDeliveryAvailable;

  ShopModel({
    required this.id,
    required this.shopName,
    required this.fullAddress,
    required this.city,
    required this.state,
    required this.shopImage,
    required this.isDeliveryAvailable,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'] ?? '',
      shopName: json['shopName'] ?? '',
      fullAddress: json['fullAddress'] ?? json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      shopImage: json['shopImage'] ?? 'assets/store1.png',
      isDeliveryAvailable: json['isDeliveryAvailable'] ?? false,
    );
  }
}
