// `static` class variables and methods are variables and methods that belong to a class itself, and not to any specific instance of that class.

// NOTE: Use `static` for variables/methods that are specific to a class, rather than instances of that class.

// NOTE: Use `static const` to define a "global" constant that belongs to a class. This can be better than having constant variables in the global scope because you can put `static` variables that belong together inside a class.

class Strings {
  static const welcome = 'Welcome';
  static const signIn = 'Sign in';
  static String greet(String name) => 'Hi $name';
}

void main(List<String> args) {
  final string = Strings();
  // string.welcome; // Compile-time error because you can't access static variables using instances of a class.
  print(Strings.welcome);
  print(Strings.signIn);
  print(Strings.greet('Moyin'));
  // Strings.signIn = 'hi';
  // print(Strings.signIn);
}
