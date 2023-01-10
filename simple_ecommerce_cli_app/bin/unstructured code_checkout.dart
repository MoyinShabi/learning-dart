import 'dart:io';

// 1.
class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  // 7b. Getter to display name and price of a product:
  String get displayName =>
      '($initial)${name.substring(1)}: N$price'; // 10. Modified `displayName`
  // to show the `initial` also.
  // 9. Getter to get the first letter of a product name:
  String get initial => name.substring(0, 1);
}

// 2. Representing a selected item of a product along with a quantity:
class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  double get price =>
      quantity * product.price; // Getter to calculate the price.

  // 15.
  @override
  String toString() => '$quantity x ${product.name}: N$price';
}

/* 3. Empty class. Representing the cart that should contain all the items
that the user can add using the interactive prompt: */
class Cart {
  // 13. Adding items to the cart:
  final Map<int, Item> _items = {}; // Private member variable.

  // Creating a method to add the number of items of a product selected by a user,
  // to the cart.
  void addProduct(Product product) {
    // Storing (the value of) a selected item of a product. It is `null` the first time.
    final item = _items[product.id];
    //`product.id` -> key. `_items[product.id]` -> value.
    // Checking if we already have the item in the map/cart with the given product id:
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
      // Sets (the `value` of) a new item / adds a new item to the cart if it wasn't already there.
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
      // Sets (adds) another item of the same product which increases the quantity of the item in the cart.
    }
    /* NOTE: When we do this, we are not mutating (changing) the state of the
  existing `item` defined above (cause it's `final` so we can't), and instead 
  we are setting a new item altogether. And as a result, the `Item` class itself 
  can be immutable and the `quantity` can be a `final` variable. So, the only thing 
  that changes are the `keys` (`product.id`) and `values` (`_items[product.id]) of the `_items` map.*/
  }

  // 23. Exposing a way to check if the cart is empty by keeping `_items` private.
  bool get isEmpty => _items.isEmpty;

  // 17. Method to calculate the total price of items in the cart
  double total() => _items.values
      .map((item) => item.price) // Gets all the item prices
      .reduce((value, element) => value + element); // Combines them
  // and gets the total

  /* A nice string representation of all the content in the cart 
  which will be used when the user chooses to "view" the cart 
  from the "interactive prompt": */
  @override
  String toString() {
    // 14.
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    // 16. Showing the list of all the items in the cart
    final itemizedList =
        _items.values.map((item) => item.toString()).join('\n');
    // 18.
    return '------\n$itemizedList\nTotal: N${total()}\n------';
  }
}

// 4.
/* Pseudo code for the user interactive prompt:
  - loop
    - prompt: view cart / add item / checkout. shows the list of all products available.
    - if selection == add item
      - choose a product from list of products
      - add it to the cart considering two possible cases:
        1. The product was never added to the cart (item quantity = 1)
        2. The cart already contains an item of that product
        (increment item quantity by 1)
      - print cart
    - else if selection == view cart
      - print cart
    - else if selection == checkout
      - do checkout
      - exit
    - end.
   */

/* 6. `global` constant variable. The user has to choose one of the products. */
const allProducts = [
  Product(id: 1, name: 'apples', price: 100),
  Product(id: 2, name: 'bananas', price: 150),
  Product(id: 3, name: 'oranges', price: 50),
  Product(id: 4, name: 'grapes', price: 200),
  Product(id: 5, name: 'cabbages', price: 300),
  Product(id: 6, name: 'potatoes', price: 400),
];

void main(List<String> args) {
  final cart = Cart(); // 19.
  // 5. With empty if-else if statements
  while (true) {
    stdout
        .write('What do you want to do? (v)iew cart, (a)dd item, (c)heckout: ');
    final input = stdin.readLineSync();
    if (input == 'a') {
      // 12a.
      final product = chooseProduct();
      if (product != null) {
        // print(product.displayName); // 12b. For testing at this point
        // 20.
        cart.addProduct(product);
        print(cart);
      }
    } else if (input == 'v') {
      print('Your cart:');
      print(cart); // 21.
    } else if (input == 'c') {
      // 25.
      if (checkout(cart)) {
        break; // Takes us out of the program.
      }
    } else if (input != 'a' && input != 'v' && input != 'c') {
      print('Invalid input ❗');
    }
  }
}

// 7a. Empty function. Creating a function which enables the picking of a product
// from the list of products:
Product? chooseProduct() {
  // 8.
  final productsList = allProducts
      .map((product) => product.displayName)
      .join('\n'); // Like a multi-line string
  stdout.write('Available products:\n$productsList\nYour choice: ');
  final input = stdin.readLineSync();

  /* 11. Creating a `for-loop` to iterate through the list `allProducts`,
  and match the initial of a product to the input of the user, and
  return it. */
  for (var product in allProducts) {
    if (product.initial == input) {
      return product;
    }
  }
  print('Sorry, product not available');
  return null;
}

// 22. Empty function. Creating a function which will enable the checkout of items in the cart.
bool checkout(Cart cart) {
  // 24. Function body.
  if (cart.isEmpty) {
    print('❗\nCart is empty');
    return false;
  }
  final total = cart.total();
  print('Total: N$total');
  // print(cart);
  stdout.write('Payment in cash: ');
  final input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    return false;
  }
  final paid = double.tryParse(input);
  if (paid == null) {
    print('Invalid input❗');
    return false;
  }
  if (paid >= total) {
    final change = paid - total;
    print('Your change: N${change.toStringAsFixed(2)}');
    print('Have a nice day!');
    return true;
  } else {
    print('Sorry, not enough cash');
    return false;
  }
}
