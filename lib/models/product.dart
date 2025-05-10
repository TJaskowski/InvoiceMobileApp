class Product {
  final String id;
  final String name;
  final String description;
  final double netPrice;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.netPrice,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      netPrice: price ?? this.netPrice,
    );
  }
}