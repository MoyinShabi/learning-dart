class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  // Getter to display name and price of a product:
  String get displayName => '($initial)${name.substring(1)}: N$price';

  // Getter to get the first letter of a product name:
  String get initial => name.substring(0, 1);
}
