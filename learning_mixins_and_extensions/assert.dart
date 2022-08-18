/* From dart.dev docs:
  During development, use an assert statement—assert(condition, optionalMessage);
  —to disrupt normal execution if a boolean condition is `false`. */
class PositiveInt {
  const PositiveInt(this.value)
      : assert(value >= 0, 'Value cannot be negative');
  final int value;
}

void signIn(String email, String password) {
  assert(email.isNotEmpty);
  assert(password.isNotEmpty);
}

void main() {
  // const invalidAge = PositiveInt(-1);
  /* Example of a "programmer error" because it is a mistake to pass a
 negative argument to the constructor. */
  /* Creating the instance of the `PositiveInt(-1)` as a compile-time
 constant using the `const` keyword helps to spot assertion errors even
 before running the program. */
  // print(invalidAge);
  const list = [1, 2, 3];
  print(list[4]);
  // Error // Read the documentation on the `Error` class to learn more.
  signIn('', '');
}
