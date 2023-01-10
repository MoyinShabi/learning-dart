import 'product.dart';

// Representing a selected item of a product along with a quantity:
class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  double get price =>
      quantity * product.price; // Getter to calculate the price.

  @override
  String toString() => '$quantity x ${product.name}: N$price';
}
