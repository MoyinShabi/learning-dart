void main(List<String> arguments) {
  const pizzaMenu = {
    'pepperoni': 7.50,
    'vegetarian': 7.0,
    'margherita': 8.0,
  };
  const orderList = ['margherita', 'pepperoni', 'pineapple'];
  final correctedOrder = checkAvailableItems(
    order: orderList,
    menu: pizzaMenu,
  );
  if (correctedOrder.isNotEmpty) {
    print("The total price of available pizzas in your order is: \$${calculatePrice(
      order: correctedOrder,
      menu: pizzaMenu,
    ).toStringAsFixed(2)}");
  } else {
    print('There were no items in you order, please try again.');
  }
  print('Prepare the order?');
}

List<String> checkAvailableItems({required List<String> order, required Map<String, double> menu}) {
  final correctedOrder = <String>[];
  for (var item in order) {
    if (menu.containsKey(item)) {
      correctedOrder.add(item);
      print('$item pizza is available');
    } else {
      print("Sorry, $item pizza isn't available currently");
    }
  }
  return correctedOrder;
}

double calculatePrice({required List<String> order, required Map<String, double> menu}) {
  var totalPrice = 0.0;
  for (var item in order) {
    var price = menu[item] as double;
    totalPrice += price;
  }
  return totalPrice;
}
