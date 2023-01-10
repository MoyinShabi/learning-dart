class Restaurant {
  const Restaurant({
    required this.name,
    required this.cuisine,
    required this.ratings,
  });
  final String name;
  final String cuisine;
  final List<double> ratings;

  double avgRating() {
    if (ratings.isEmpty) {
      return 0;
    }
    return ratings.reduce((current, next) => current + next) / ratings.length;
  }
}

// NOTE: Use "methods" instead of "getters" for expensive operations e.g., calculating the sum of items in a list of many values.

void main(List<String> args) {
  final restaurant = Restaurant(name: "Mo's Cuisine", cuisine: "African Jollof", ratings: [4.5, 4.3, 4.9]);
  print(restaurant.avgRating().toStringAsFixed(2));
}
