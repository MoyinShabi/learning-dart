// Getters & Setters are special methods that provide read and write access to an object's properties.

// "Getters" are functions that are used to "retrieve" the values of an object's properties. It is defined using the `get` keyword.
// "A getter has no parameters, and returns a value". You use a getter to declare a variable that can be directly computed from some of the other member variables (properties) in your class.
// Getters are also known as "Computed variables". Regular member variables are known as "Stored variables", because they are stored in memory.

// "Setters" are functions that are used to "write" the values of an object's properties. It is defined using the `set` keyword.
// "A setter has one parameter and does not return a value".

class Temperature {
  Temperature.celsius(this.celsius);
  Temperature.fahrenheit(double fahrenheit)
      : celsius = (fahrenheit - 32) /
            1.8; // This constructor uses an initializer list to set the value of the `celsius` property as the computed value from the expression involving the required argument, `fahrenheit`.

  double celsius;
  double get fahrenheit => (celsius * 1.8) + 32;
  // Getter. Returns a computed value from the expression, using the `celsius` member variable.
  void set fahrenheit(double fahrenheit) => celsius = (fahrenheit - 32) / 1.8;
  // Setter. Doesn't return anything but computes and "sets" the value of the `celsius` member variable using the value of the `fahrenheit` argument provided.
}

void main(List<String> args) {
  final temp1 = Temperature.celsius(26.0);
  final temp2 = Temperature.fahrenheit(78.8);
  print(temp1.celsius); // 26.0
  print(temp2.celsius); // 25.999999999999996

  temp1.celsius = 50; // Setting the `celsius` property normally.

  print(temp1
      .fahrenheit); // 122.0 - Calling the getter. It returns the computed temperature in fahrenheit from the expression involving the current value of the `celsius` property.

  temp1.fahrenheit =
      90; // Calling the setter. Enables us to set the value of the temperature in fahrenheit which also reassigns (sets) the value of the `celsius` property.

  print(temp1.fahrenheit); // 90.0
  print(temp1.celsius); // 32.22222222222222
}
