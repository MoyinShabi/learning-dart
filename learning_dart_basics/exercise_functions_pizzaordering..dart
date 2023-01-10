void main() {
  const order = ['margherita', 'pepperoni', 'pineapple'];
  var total = calculateTotal(order);
  print('Your order total is: \$${total.toStringAsFixed(2)}');
}

double calculateTotal(List<String> orderList) {
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };
  var total = 0.0;
  for (var item in orderList) {
    final price = pizzaPrices[item];
    if (price != null) {
      total += price;
    } else {}
  }
  return total;
}
