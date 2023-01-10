void main(List<String> args) {
  final sayHi = (String name) => 'Hi $name';
  print('--1--');
  welcome(sayHi, 'Moyin');
  // Because the parameter(s) type(s), number of parameters, and return type of the anonymous function matches the parameter(s) type(s), number of parameters, and return type of the function `greet` declared as a parameter in the function `welcome`, this code is valid. So, `sayHi` of the type `String Function(String)` must match `greet` of type `String Function(String)` also.

  final sayHi1 = (String firstName, int age) => 'Hi $firstName, $age';
  print('--2--');
  welcome1(sayHi1, 'Moyin');

  // welcome((String p0) => 'Hello $p0', 'Temi');
  // welcome((String p0) {
  //   return 'Temi';
  // }, 'Moyin');

  print('--3--');
  welcome2(sayHi2, 'Mo');
  welcome2(sayBonjour, 'Mo');
  welcome2(sayHola, 'Mo');

  // CLOSURES:
  // Closures are very closely related to anonymous functions. When we declare an anonymous function that uses some variables that are defined outside its own scope, that function is called a "closure".
  const multiplier = 10;
  const list = [1, 2, 3];
  final result = list.map((e) => e * multiplier);
  // `(e) => e * multiplier` is an anonymous function with `multiplier` belonging to the parent scope. Therefore, it is "closure".
  print('--4--');
  print(result);

  // `forEach` & `map` METHODS:
  // The `forEach()` method (Read Docs)
  const listOfInts = [1, 2, 3, 4, 5, 6, 7];
  print('--5--');
  listOfInts.forEach((value) => print(value));
  print('--6--');
  listOfInts.forEach((value) {
    print(value * 2);
  });
  print('--7--');
  listOfInts.forEach(print);
  // Passing the existing named function `print` as an argument.

  // The `map()` method
  final multiply = listOfInts.map((value) {
    return 'M: ${value * 3}';
  });
  print('--8--');
  print(multiply);
  // `map()` returns an (a lazy) `Iterable` and we can assign the result to a variable and then iterate on that variable using a `for` loop. The function passed as an argument is not evaluated until the resulting iterable is used (i.e., the variable it's assigned to. For example, by printing it). This is a performance optimization to ensure that the resulting items are only calculated when they are needed.
  // An `Iterable` is a collection of methods that can be accessed sequentially. When we print an `Iterable`, all items appear in a pair of parentheses `()`.

  // Converting variable to type `List<String>` from `Iterable<String>`:
  final add = listOfInts.map((value) => 'A: ${value + 1}').toList();
  print('--9--');
  print(add);

  print('--10--');
  print(doSomething(10, 20)()); // Printing the function call to get the result
}

// FUNCTIONS AS FIRST CLASS OBJECTS: Functions can be assigned to variables, passed as arguments to other functions, and can also be returned as results.

void welcome(String Function(String) greet, String name) {
// Declaring a function as the first parameter, called `greet` of the type `Function`, which takes (must take) a `String` argument itself, and returns (must return) a `String` also.
// Calling the function in a print statement because it returns a value:
  print(greet(name));
  print('Welcome to this course');
}

void welcome1(String Function(String, int) greet, String name) {
  print(greet(name, 19));
  print('Welcome to this course');
}
/* My explanation: `welcome1` has in its parameter list a declared function
prototype, `greet`, with just its parameter types and not the names. 
You call this function prototype in the scope of where it was declared i.e.,
in the body of the `welcome1` function. Where then is the complete function 
header line and body of the declared function prototype, `greet`? 
It's function header line will automatically be that of the matching function,
`sayHi1`, passed into the `welcome1` function as an argument of its parameter
of type `Function`. Whatever was passed as the arguments in the function 
call of the `greet` function will automatically get passed into `sayHi1` 
as the arguments of its declared parameters whose types match that of
`greet`, and can then be used where needed, in its function body. 
Whatever is returned as the result from `sayHi1` will automatically get 
returned in the function call of `greet` in the `welcome1` function or 
in other words, the function body of `sayHi1` will automatically be the function 
body of `greet`. */

int Function() doSomething(
  int lhs,
  int rhs,
) =>
    () => lhs + rhs;

// FUNCTION TYPES using `typedef`:
// `typedef` helps to define a named function type to improve code readability.
typedef Greet = String Function(String);
/*OR typedef String Greet(String name);
`Greet` can then be used as the `type` of the function as the first argument 
of the declared function below, instead of the specified function type, which 
is longer. It is also known as an "alias" which is basically another name 
given to a function type so that it can be reused. */

/* Note: If you need to use a certain function type more than once, you can
write a typedef as shown above and then use it as a function type inside an 
argument (parameter) list. That way you can give a meaningful name to the
function type. But if you need a new function type just once, then you don't 
need to name it. And in any case, you can always refactor it into a typedef later. */

void welcome2(Greet greet, String name) {
  print(greet(name));
}

String sayHi2(String name) => 'Hi $name';
String sayBonjour(String name) => 'Bonjour $name';
String sayHola(String name) => 'Hola $name';

/* Note:
Build-up design pattern: Easy implementation by using functions as arguments
which helps to write code that is more composable(in Flutter?). */
