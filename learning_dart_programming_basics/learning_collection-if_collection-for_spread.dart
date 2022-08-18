void main() {
  // To normally add a value to a list depending on if a variable is true:
  final colors = ['grey', 'brown'];
  const addBlue = false;
  const addRed = true;
  if (addBlue == true) {
    colors.add('blue');
  }
  if (addRed) {
    colors.add('red');
  }
  print(colors); // [grey, brown, red]

  // Adding items in a list variable at once to another:
  const extraColors = ['yellow', 'green'];
  colors.addAll(extraColors);
  print(colors); // [grey, brown, red, yellow, green]

  const moreColors = ['purple', 'orange'];
  const addMoreColors = true;

  // Using a `Collection-if`, `Collection-for`, and spread operator `...` to more easily declare collections of values:
  final colors2 = [
    'grey',
    'brown',
    if (addBlue == true)
      'blue', // `Collection-if` which can be used directly in a list literal unlike the normal `if` statement above.
    if (addRed) 'red', // `Collection-if` also
    for (var color in extraColors)
      color, // `Collection-for` which can be used instead of the `addAll` method above.
    ...moreColors, // `Spread, ...` which adds the elements of a list to the enclosing list just like a `collection-for`, but much easier.
    if (addMoreColors) ['white', 'black'],
    if (addMoreColors) ...['white', 'black'],
    // Shows that the collection-if, collection-for, and spread are composable.
  ];
  print(colors2);
  // [grey, brown, red, yellow, green, purple, orange, white, black]

  // Using a `Collection-if`, and spread operator `...` with Maps:
  const ratings = [4.0, 4.5, 3.5];
  final restaurant = {
    'name': 'Pizza Hut',
    'cuisine': 'Italian',
    if (ratings.length >= 3) ...{
      'ratings': ratings,
      'isPopular': true,
    },
  };
  print(
      restaurant); // {name: Pizza Hut, cuisine: Italian, ratings: [4.0, 4.5, 3.5], isPopular: true}
}
