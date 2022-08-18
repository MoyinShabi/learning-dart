import 'number_parsing.dart';

void main(List<String> args) {
  final parsedInt = int.tryParse('123'); // Doesn't read very well in english.
  print(parsedInt);

  print('123'.toIntOrNull());
  print('7890'.toIntOrNull());
  print('hi'.toIntOrNull());
  print('45'.toIntTimesTwoOrNull());
}

/* Extensions are quite useful, and because of this, you normally want
to keep them in separate files so that you can import them in 
multiple places as.
NOTE: Only "named" extensions can be imported. */