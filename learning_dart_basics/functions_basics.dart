void main() {
// FUNCTION CALLS:
  print('--1--');
  sayingHi();
  print('--2--');
  sayingHi();

  const name = 'Moyin';
  const age = 19;
  const name1 = 'Bolu';
  const age1 = 22;

  // Note: Function arguments passed in a function call can be variables, expressions, or literals as long as they have the correct type and are in the right order.
  print('--3--');
  describe(name, age);
  // Each argument is identified by its position in the arguments list of the declared function(i.e., they are specified in the same order as in the declared function).

  print('--4--');
  describe(name1, age1);
  print('--5--');
  describe('Temi', 19);

  final person1 = describe1(name, age);
  // Assigning the return value to a variable in order to use it in the rest of the program.
  print('--6--');
  print(person1);
  // We now have a reusable piece of code that describes a person by name and age and we can use the return value any way we want.

  var person2 = describe2(name: 'Moyin');
  print('--7--');
  print(person2);

  print('--8--');
  print(describe3());
  print(describe3(name: 'Temi'));
  print(describe3(age: 19));
  print(describe3(age: 19, name: 'Temi'));

  print('--9--');
  doStuff();

  print('--10--');
  print(describe4(name: 'Moyin', age: 19));

  print('--11--');
  foo(1, 2);

  print('--12--');
  foo1(2);
  foo1(2, 3);
  foo1(1, 2, 3);

  print('--13--');
  foo2(2);
  foo2(2, 4);
  foo2(2, 4, 5);

  print('--14--');
  foo3(1);
  foo3(1, b: 2);
  foo3(1, c: 3, b: 2);

  print('--15--');
  print(say('Moyin', 'hi'));
  print(say('Moyin', 'hi', 'phone'));

  print('--16--');
  print(sum(1, 2));

  print('--17--');
  printSum(1, 2);

  // ANONYMOUS FUNCTION:
  final saysHi = (String name) {
    return 'Hi, $name';
  }; // `saysHi` is not a conventional variable that holds a value but instead references an "anonymous function", and so it is of a type `String Function(String)`.
  // OR final saysHi = (String name) => 'Hi, $name';
  print('--18--');
  print(saysHi('Moyin'));
  // The variable used as the anonymous function needs to be called with an argument passed in the parenthesis, like this.
  print('--19--');
  print(saysHi);
  // If the parenthesis is omitted, there's no compile-time error and the output is: Closure: (String) => String
  // A closure can be thought of as an anonymous function.
}

// "Functions" help to encapsulate some code that we can reuse and call multiple times.
// They are essential building blocks that we can use to build more complex programs
// because they let us better organize our code and make it more reusable.

// SIMPLE FUNCTION:
void sayingHi() {
  print('Hi');
  print('World');
}

// FUNCTION PARAMETERS:
void describe(String name, int age) {
  print("My name is $name. I'm $age years old");
}
// The function contains "required positional parameters".

// Note: Functions help us to write more maintainable code, because we can change the way a function behaves without changing how we call it.
// Note:
//We create functions to "do" something
//So function names should start with a "verb" and when we declare variables, we should use a "noun".

// RETURN VALUE:
//In Dart, we can create functions that return a value so that we can do something with it other than just printing it.
//`void` in the functions above means that the function has no return value.
String describe1(String name, int age) {
  return "My name is $name, I'm $age years old"; //The return value must match the return type of the function.
}

// NAMED AND POSITIONAL PARAMETERS- Two different ways of declaring function parameters in Dart.

// NAMED PARAMETERS
// Named parameters by default are "optional" and not-required.
/* 
String describe2({String name, int age}) {
  return "My name is $name, I'm $age years old";
}
This generates a compile-time error as a null safety precaution because 
the default implicit value of "optional named parameters" of various types is `null`.
Note: Because all types are "non-nullable" by default, they can't have "null values" assigned to them. 
So, if an optional named argument is not specified in a function call, 
it defaults to `null` which goes against "Null Safety".*/

// FIX 1- Making the parameters "nullable" if we really want the arguments in the function call to be `null` by default:
// This is not a good solution though, because we don't want the arguments to be `null` when we interpolate them inside the string.
String describe2({String? name, int? age}) {
  return "My name is $name, I'm $age years old";
}

// FIX 2- Providing default values for the parameters:
// Note: Default values are a good strategy if you want arguments to be optional and you have sensible default values that you can assign to them. They must be compile-time constants.
//It is not a good solution when there aren't obvious values that can be chosen as default values for arguments.
//In that case, what you need to tell Dart is that the named parameters are required so that it's not possible to call the function unless the arguments are specified. (FIX 3)
String describe3({String name = 'Moyin', int age = 0}) {
  return "My name is $name, I'm $age years old";
}

// Example 2- passing a list and map as default values:
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
}

// FIX 3- Declaring each parameter as `required` (using a `required` modifier):
String describe4({required String name, required int age}) {
  return "My name is $name, I'm $age years old";
}

// POSITIONAL PARAMETERS
/* Positional parameters are "required" by default. But it is also possible to declare positional parameters that are "optional". */

// Required positional parameters:
void foo(int a, int b) {
  print('a: $a, b: $b');
}

// Optional positional parameters:
/* void foo(int a, [int b]) {
  print('a: $a, b: $b');
} 
Just like with optional named parameters, this generates a compile-time error as a null safety precaution because the default implicit value of optional positional parameters of various types is `null`.
*/

// FIX 1- Making the parameters "nullable" if we really want the arguments in the function call to be `null` by default:
void foo1(int a, [int? b, int? c]) {
  print('a: $a, b: $b, c: $c');
}

// Example 2:
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

// FIX 2- Providing default values for the parameters:
void foo2(int a, [int b = 2, int c = 3]) {
  print('a: $a, b: $b, c: $c');
}

// MIXING POSITIONAL AND NAMED ARGUMENTS
void foo3(int a, {int b = 4, int c = 5}) {
  print('a: $a, b: $b, c: $c');
}
// As long as we list the (required) positional arguments first, followed by the (optional) named arguments, then this is valid syntax.

// FAT ARROW NOTATION (=>)- Helps to write more concise code when a function"s body has only one statement.
int sum(int x, int y) => x + y;
// Removes the curly braces and `return` keyword in a normal function declaration.

void printSum(int x, int y) => print(x + y); 
// Removes the curly braces in a normal function declaration.

// NOTE: When writing programs, and you have some code that solves a specific task, ask yourself if it should live inside a function. And if so, choose a good function name, and decide what arguments it should take. Use named or positional arguments as appropriate, so that it's clear from the context what the function does.
