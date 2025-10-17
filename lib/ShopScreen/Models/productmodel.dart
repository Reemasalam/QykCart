class ProductModel {
  final String productName;
  final String description;
  final String image;
  final double salePrice;
  final double discountPrice;
  final bool hasStock;
  final String unit;
  final double weight;
  final String shopId;

  ProductModel({
    required this.productName,
    required this.description,
    required this.image,
    required this.salePrice,
    required this.discountPrice,
    required this.hasStock,
    required this.unit,
    required this.weight,
    required this.shopId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      salePrice: (json['salePrice'] ?? 0).toDouble(),
      discountPrice: (json['discountPrice'] ?? 0).toDouble(),
      hasStock: json['hasStock'] ?? false,
      unit: json['unit'] ?? '',
      weight: (json['weight'] ?? 0).toDouble(),
      shopId: json['shopId'] ?? '',
    );
  }
}
