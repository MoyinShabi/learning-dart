import 'item.dart';
import 'product.dart';

/* Representing the cart that should contain all the items that the user 
can add using the interactive prompt: */
class Cart {
  final Map<int, Item> _items = {};

  // Getter to check if the cart is empty while keeping `_items` private:
  bool get isEmpty => _items.isEmpty;

  /* Method to implement adding the number of items of a product selected by a user,
  to the cart: */
  void addProduct(Product product) {
    // Storing (the value of) a selected item of a product. It is `null` the first time.
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
      // Sets (the `value` of) a new item / adds a new item to the cart if it wasn't already there.
    } else {
      // print(_items[product.id]);
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
      // Sets (adds) another item of the same product which increases the quantity of the product in the cart.
    }
  }

  // Method to calculate the total price of items in the cart:
  double total() => _items.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);

  /* A nice string representation of all the content in the cart 
  which will be used when the user chooses to "view" the cart 
  from the "interactive prompt": */
  @override
  String toString() {
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    // Storing the list of all the items in the cart as a multi-line string:
    final itemizedList =
        _items.values.map((item) => item.toString()).join('\n');
    return '------\n$itemizedList\nTotal: N${total()}\n------';
  }
}
