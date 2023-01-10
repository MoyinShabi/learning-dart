// A class to model a complex number:
class Complex1 {
  Complex1(this.re, this.im); // Without `const` constructor
  final double re;
  final double im;
}

class Complex2 {
  const Complex2(this.re, this.im); // With `const` constructor
  final double re;
  final double im;
}

void main(List<String> args) {
  // const complexNo = Complex1(1, 2); // Compile-time error because the constructor being called isn't a `const` constructor.

  const complexNo2 = Complex2(1, 2); // No error because the constructor being called is a `const` constructor.

  const list = [
    Complex2(1, 2),
    Complex2(4, 5),
  ];
}

// NOTE: As a best practice, when you have a class that has only immutable `final` member variables, then you should give it a `const` constructor and when you do so, the compiler can do some optimizations, and make your program more efficient. So, when you create a class with a `const` constructor, you can use it to create instances that are compile-time constants, just like you do with the built-in types, such as int, double, or String.

// NOTE: You can't define a `const` constructor for a class with non-final member variables, because if a member variable in the class is mutable, then instances of the class can't be `const` in the first place.

// NOTE: If a class has a `const` constructor, you can also use it to define a `const` list literal. That is, you can create `const` collections containing instances of a class.
