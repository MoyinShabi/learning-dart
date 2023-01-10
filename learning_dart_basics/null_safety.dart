void main() {
  // NULL VALUES
  const person = {'name': 'Andrea'}; //A map
  print('--1--');
  print(
      person['age']); // null -This means that there is 'no value' for this key.
  // There are many situations in a program where it's useful to use null values.

  // Using `if` statements to check if a value is `null`:
  print('--2--');
  if (person['age'] == null) {
    print('age is missing'); // age is missing
  } else {
    print(person['age']);
  }

  /* Note: There are cases where `null` values are not necessary and not even desirable
   because if we can guarantee that an expression or value is never `null` then we don't even need to check for it. 

  "Null Safety" is a language feature that makes it possible to decide at compile-time 
  if a variable can be `null` or not.
  It makes writing code more productive which is especially a great advantage in bigger programs.
  */

  // NULLABLE & NON-NULLABLE VARIABLES
  // int a = null; //Compile-time error -Because *variable types are "non-nullable" by default and can't be null.
  // int b; //Un-initialized variable which is "non-nullable" by default.
  // b = null; //Also error -Because variable types are "non-nullable" by default and can't be null.
  // b = 2 //No error.

  print('--3--');
  int? c = null;
  //No Error -Using `int?` declares this variable as "nullable" and so it can be initialized as `null`
  int? d;
  // Un-initialized variable set to "null" by default without any compiler errors.
  // d = null; //No error
  print(d); // null

  print('--4--');
  int e = 2;
  // print(d + e); // Compile-time error -Two variables can't be added if one of them (`d`) is null or nullable.
  d = 2;
  print(d); // 2
  print(d + e); // 4

  // FLOW ANALYSIS: PROMOTION
  print('--5--');
  int? f;
  int g = 2;
  if (f == null) {
    print('f is null'); // f is null
  } else {
    print(f + g);
    // Thanks to Flow Analysis, the variable `f` is promoted from "nullable value" to "non-nullable value" inside the `else` branch.
  }

  // FLOW ANALYSIS: DEFINITE ASSIGNMENT
  print('--6--');
  int h = 10;
  int sign;
  // print(sign); //Compile-time error -Because the "non-nullable variable" must be assigned before it can be used.
  // A FIX:
  if (h >= 0) {
    sign = 1;
  } else {
    sign = -1;
  }
  //OR
  // int sign = h >= 0 ? 1 : -1; //Using the "Ternary operator" which is best if your conditional logic is as simple as this and not more complex.
  print(sign); // 1
  // This is possible thanks to a feature called "definite assignment". With this, Dart knows for sure when `sign` is assigned before the print statement is executed. --It is very useful because it allows us to declare "non-nullable variables" and initialize them later. If we try to print `sign` before it is definitely assigned, Dart will generate an error, as shown above.
  // Dart uses Flow analysis features to help us write safer code and more easily deal with nullable & non-nullable variables.

  // ASSERTION OPERATOR (!)- Used to assign a nullable value to a non-nullable variable.
  print('--7--');
  int x = 30;
  int? maybeValue; // Nullable variable that is only assigned if `x > 0`.
  print(maybeValue); // null

  if (x > 0) {
    maybeValue = x;
  }
  print(maybeValue); // 30

  // int value = maybeValue; // Compile-time error -Because a "nullable value", (`maybeValue`, null, of type `int?`), can't be assigned to a "non-nullable variable", (`value` of type `int`). At this time, at compile-time, the computer assumes that `maybeValue` contains a nullable value, `null` from it's declaration, because the `if` statement is executed at run-time and not compile-time.

  int value = maybeValue!;
  // Assertion operator(!), used when it is sure that a "nullable variable" (e.g `maybeValue`) will "always" have a "non-nullable value" after the program is run (e.g `30` from the `if` statement above, after it is executed at run-time) and then assigns it to a "non-nullable variable" (e.g `value`), without any error.
  //Note: If `int x = -1` above, it will generate an error at runtime because the assertion operator `!` (null check operator or bang operator) was used on a "null value". Try it.
  print(value); // 30

  // if-null (??) OPERATOR- Used to deal with incorrect use of the assertion operator(!) (using it on a null value) but without risking any runtime errors.
  print('--8--');
  int x1 = -1;
  int? maybeValue1; // Nullable variable that is only assigned if `x > 0`.
  print(maybeValue1); // null

  if (x1 > 0) {
    maybeValue1 = x1;
  }
  print(maybeValue1);

  int value1 = maybeValue1 == null ? 0 : maybeValue1;
  // Using the Ternary Operator to assign a value of `0` to `value1` if `maybeValue1` is `null`:
  print(value1); // 0 -Because for `int x1 = -1`, `maybeValue1` is `null`.

  // Another way to write the above Logic with much less code using the if-null `??` operator:
  print('--9--');
  int value2 = maybeValue1 ?? 0;
  // The if-null `??` operator assigns the value of `maybeValue1` to `value2` if it's not `null` but assigns `0` if it is `null`. It basically works like the ternary operator but with much less code.
  print(value2); // 0

  // NOTE:
  //Use `??` if you have a default(or fallback) value that you want to assign (e.g `0` above) when a value or expression is `null` (e.g `maybeValue1` above).
  //Use `!` if you're sure that an expression or value you want to assign to a "non-nullable variable" will never be `null` at runtime (e.g `maybeValue` from the example above).

  //As you write your own programs, it is your job to work out what is the appropriate code to write.

  // AUGMENTED if-null `??=` operator
  print('--10--');
  int? maybeValue2;
  maybeValue2 ??= 0;
  // This operator assigns `0` to `maybeValue2`, but only if it is currently `null`
  int value3 = maybeValue2;
  // So the `if-null` operator is not needed at this step.
  print(value3); // 0

  // TYPE INFERENCE WITH NULL SAFETY
  print('--11--');
  const x2 = -1;
  var maybeValue3; // It's harder to infer the type of this variable because it is not initialized when it's declared. So, Dart infers it as `dynamic`.
  if (x2 > 0) {
    maybeValue3 = x2;
  }
  maybeValue3 ??= 0;
  final value4 = maybeValue3;
  print(value4); // 0

  // Note: Whenever possible, initialize variables when you declare them so your code will be clearer and you can make the most of type inference.

  // NULL SAFETY WITH COLLECTIONS
  print('--12--');
  const cities = [
    'London',
    'Paris',
    null
  ]; // No error -Because we've not specified any type constraints (type annotation);
  // const cities1 = <String>['London', 'Paris', null]; // Error -Because null safety only allows us to add "non-null strings" to this list" with type annotation.
  const cities1 = <String?>[
    'London',
    'Paris',
    null
  ]; // This type annotation (<String?>) then allows us to have "null values" inside the list.

  // Iterating through the List:
  for (var city in cities1) {
    // print(city.toUpperCase()); // Compile-time error -Because `city` can be `null` from the `cities2`, and so a `null variable` can't be used to call a method.
    // A fix:
    if (city != null) {
      print(city.toUpperCase());
      // Dart promotes `city` to a "non-nullable value" inside the `if` statement.
    }
    // LONDON
    // PARIS
  }

  // CONDITIONAL ACCESS OPERATOR (`?.`)- Used to call a method only if the variable is not null.
  print('--13--');
  const cities2 = <String?>['London', 'Paris', null];
  for (var city in cities2) {
    print(city?.toUpperCase());
    // This expression will return the uppercase version of the string if it is not null and it will return `null` otherwise, instead of generating an error (because the method was called on a null variable). This Null Safety feature helps us write code that is safer.
  }
  // LONDON
  // PARIS
  // null

  // NOTE: Calling methods on variables that are `null` is one of the most common mistakes that programmers make because null checks (like shown above) are often forgotten to be made. With Null Safety, Dart can tell us at compile-time when we forget to check if a variable is `null`.

  // TAKEAWAY: Every time you declare a variable in Dart, think about whether it should be nullable or not. This will lead to better code.
}
