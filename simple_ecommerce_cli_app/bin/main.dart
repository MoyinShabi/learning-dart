import 'dart:io';

import 'package:test/cart.dart';
import 'package:test/product.dart';

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

const allProducts = [
  Product(id: 1, name: 'apples', price: 100),
  Product(id: 2, name: 'bananas', price: 150),
  Product(id: 3, name: 'oranges', price: 50),
  Product(id: 4, name: 'grapes', price: 200),
  Product(id: 5, name: 'cabbages', price: 300),
  Product(id: 6, name: 'potatoes', price: 400),
];

void main(List<String> args) {
  final cart = Cart();
  while (true) {
    stdout
        .write('What do you want to do? (v)iew cart, (a)dd item, (c)heckout: ');
    final input = stdin.readLineSync();
    if (input == 'a') {
      final product = chooseProduct();
      if (product != null) {
        cart.addProduct(product);
        // TODO: Implement printing just the {quantity x product.name: total price} after adding an item to the cart, instead of `print(cart)` below, after.
        print(cart);
      }
    } else if (input == 'v') {
      print('Your cart:');
      print(cart);
    } else if (input == 'c') {
      if (checkout(cart)) {
        break;
      }
    } else if (input != 'a' && input != 'v' && input != 'c') {
      print('Invalid input ❗');
    }
  }
}

// Function to implement the picking of a product from the list of products:
Product? chooseProduct() {
  final productsList = allProducts
      .map((product) => product.displayName)
      .join('\n'); // A multi-line string

  stdout.write('Available products:\n$productsList\nYour choice: ');
  final input = stdin.readLineSync();

  // TODO: Maybe implement being able to select the quantity of an item before adding to cart? and then showing the number of items in the cart instead of printing out the cart.
  // stdout.write('Quantity: ');
  // final inputQuantity = stdin.readLineSync();

  /* Iterating through the list `allProducts`, and matching the initial of a product 
  to the input of the user, and returning it so it can be used: */
  for (var product in allProducts) {
    if (product.initial == input) {
      return product;
    }
  }
  print('Sorry, product not available');
  return null;
}

// Function to implement the checkout of items in the cart:
bool checkout(Cart cart) {
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
    print('Invalid input❗');
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
