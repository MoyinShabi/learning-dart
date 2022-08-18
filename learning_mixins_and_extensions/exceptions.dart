/* "Error"- Programmer mistake (meaning something was done wrongly in the code),
  e.g, calling a function with invalid arguments, index of a list out of bounds,
  etc. So, it's the programmer's job to address it by fixing the code.
  - Quite often, when an error occurs, the program should terminate immediately,
  because it is not safe to recover from it.

  "Exception"- Failure condition telling us that something 'unexpected' happened.
  Unexpected, meaning that something is out of the control of the programmer.
  - When an exception occurs, we should catch it and present a 
  human-readable message to let the user know that something went wrong.
  - And when an exception happens, the program or app should be able to resume
  normally.
  */

/* NOTE:
  - We can throw exceptions using the `throw` keyword, and we can
    catch them using the `try-catch` blocks.
  - Using `throw`, `try`, and `catch` makes it "explicit" that we're
    handling some unexpected exception. 
  - We can use multiple `catch` statements to check for different kinds of
    exceptions, using the `on` clause/keyword. 
  - `finally` is used to execute some code whether or not an exception is
    thrown. 
  - `rethrow` is useful whenever you want to do some exception handling
    inside a function or method (inside a `catch` block), but you still
    want the exception to move to the calling function after (e.g, `main()`
     in the case below), where you may do some further handling. */

class Fraction {
  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      throw UnsupportedError('Integer should not be divided by Zero');
      // Raising an exception
    }
  }
  final int denominator;
  final int numerator;

  double get value => numerator / denominator;
}

void testFraction() {
  // To recover from the exception thrown in code:
  try {
    final f1 = Fraction(3, 0);
    /* Because we run this code with a denominator of `0`, the `print(f.value)` 
    statement is not executed because the code throws an exception. 
    And instead, the `catch` block is executed because the exception type 
    matches, and after that the finally block is executed. */
    // final f1 = Fraction(3, 5);
    print(f1.value);
  } on UnsupportedError catch (e) {
    print(e);
    // rethrow;
    /* "re-throwing" the exception to `main()` after processing it. 
    And because the `main()` method is not catching any exceptions,
    then the program execution is interrupted.*/
  } on Exception catch (e) {
    print(e);
  } finally {
    print('Testing 1, 2, 3, ...');
  }
}

void main(List<String> args) {
  // final f = Fraction(3, 0);
  // print(f.value);

  testFraction();
  print('done');

  /* try {
    testFraction();
  } catch (e, st) {
    print('error: $e, stack trace: $st');
  } */
  /* By using `rethrow` above and catching the exception, the print 
  statement `print('error: $e, stack trace: $st');` above will have access
  to the entire call stack that was already captured inside `testFunction()`. */
}
