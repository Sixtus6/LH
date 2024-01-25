class ProductModel {
  ProductModel({
    required this.rate,
    required this.category,
    required this.imageUrl,
    required this.price,
  });
  final String rate;
  final String category;
  final String imageUrl;
  final num price;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      rate: json["rating"]['rate'].toString(),
      category: json['category'],
      imageUrl: json['image'],
      price: json['price'].toInt() as int,
    );
  }
}
