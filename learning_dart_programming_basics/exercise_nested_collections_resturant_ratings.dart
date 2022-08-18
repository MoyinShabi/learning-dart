void main() {
  var restaurants = [
    {
      'name': 'Pizza Mario',
      'cuisine': 'Italian',
      'ratings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'ratings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'Navaratna',
      'cuisine': 'Indian',
      'ratings': [4.0, 4.5, 4.0],
    },
  ];

  for (var restaurant in restaurants) {
    final ratings = restaurant['ratings'] as List<double>;
    //Calculating the average rating of each restaurant:
    var sum = 0.0;

    for (var rating in ratings) {
      sum += rating;
    }
    final averageRating = sum / ratings.length;
    restaurant['avgRating'] = averageRating.toStringAsFixed(2);
    print(restaurant);
  }

  print(restaurants);
}
