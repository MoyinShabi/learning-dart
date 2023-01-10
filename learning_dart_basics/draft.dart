void main() {
  const pizzaMenu = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  const pizzaOrder = ['pineapple', 'suya', 'margherita', 'pepperoni'];

  var total = 0.0;
  String orderErrorMessage = '';
  // final Set<String> availablePizzas = pizzaOrder
  //     .toSet()
  //     .intersection(pizzaMenu.entries.map((e) => (e.key)).toSet());
  // print(availablePizzas);

  //Calculating the total for a given order
  for (var item in pizzaOrder) {
    //Iterating through all the items in the list of the order
    final price = pizzaMenu[item] as double;
    //In this for loop, `final price = pizzaMenu[item]` is only "read" more than once so it doesn't give an error. So, the items are used as keys to get the corresponding prices from the values in the map `menu`.
    if (pizzaMenu.keys.contains(item)) {
      //price != null
      //That is, if an item in the list is actually a key in the `pizzaMenu` map with a corresponding value that can be assigned as a price to the variable `price`.
      total += price;
    } else {
      // print("$item pizza is not on the menu");
      orderErrorMessage += '$item pizza, ';
    }
  }
  // print("The total price of your order is \$$total");
  print(orderErrorMessage);
  print(orderErrorMessage.length);
  if (orderErrorMessage != '') {
    print(
        'Sorry, these item(s) are not on the menu: ${orderErrorMessage.substring(0, orderErrorMessage.length - 2)}.');
  }

  if (total > 0.0) {
    print("Your order total is: \$${total}"); //.toStringAsFixed(2)
  } else {
    print("Sorry, we didn't have any of your requested items.");
  }
}
