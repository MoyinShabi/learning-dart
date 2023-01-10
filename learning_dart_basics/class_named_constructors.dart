// "Named constructors" are all about giving you a more expressive way of creating specific instances for your classes. By using them, you can make your classes easier to use correctly, and harder to use incorrectly.

// Example 1
class ComplexNo {
  const ComplexNo(this.re, this.im); // "Default constructor".
  // Declaring "Named constructors" with initializer lists to reserve special complex numbers:
  const ComplexNo.zero() // Not taking any arguments.
      : re = 0, // Setting the variable to `0`
        im = 0; // Setting the variable to `0`
  const ComplexNo.identity()
      : re = 1,
        im = 0;
  const ComplexNo.real(this.re) : im = 0;
  const ComplexNo.imaginary(this.im) : re = 0;

  final double re;
  final double im;

  void printNo() {
    print('$re + ${im}i');
  }
}

// Example 2
class Temperature {
  // Constructors which take into account whether the temperature is inputted in degree celsius or fahrenheit.
  Temperature.celsius(this.celsius);
  Temperature.fahrenheit(double fahrenheit) : celsius = (fahrenheit - 32) / 1.8; // This initializes the `celsius` member variable by converting the inputted argument, in fahrenheit, to celsius.

  double celsius;
}

void main(List<String> args) {
  // Example 1
  final zero = ComplexNo.zero();
  final identity = ComplexNo.identity();
  final real = ComplexNo.real(5);
  final imaginary = ComplexNo.imaginary(6);
  // This syntax is more readable and easier to use, and it makes it harder to make mistakes by passing the wrong arguments.
  zero.printNo();
  identity.printNo();
  real.printNo();
  imaginary.printNo();

  // Example 2
  final temp1 = Temperature.celsius(26.0); // Creating a `Temperature` object (an instance of the `Temperature` class) using celsius.
  final temp2 = Temperature.fahrenheit(78.8); // Creating a `Temperature` object using fahrenheit.
  print(temp1.celsius);
  print(temp2.celsius);
  temp1.celsius = 32;
}
