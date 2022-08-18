/*- A `Future` represents the result of an asynchronous operation, and
we can use futures to "wait" for an asynchronous operation to complete.
For example, fetching data from the network, or writing to a database,
or reading data from a file.

- From RW Dart Book: "Dart has a type called `Future`, which is basically
a "promise" to give you the value you really want later. "

- Futures can have two states: uncompleted and completed.
- We say that a `Future` is "uncompleted" when it is "waiting for an 
asynchronous operation to finish".
- When it finishes ("completed"), the asynchronous operation returns a value 
or throws an error, and it is very important that we handle both cases in
 our code.
*/

/* Example:
Code to run a cafe. A user can place an order, and when it is ready, we
can say that the order is "complete". */

Future<String> fetchUserOrder() => Future.delayed(
      Duration(seconds: 2),
      () => 'Hot Chocolate',
      // () => throw Exception('Out of milk'),
    );
// `Future.delayed()` is a factory constructor for the `Future` class.

Future<String> fetchUserOrder2() => Future.value('Americano');
// `Future.value()` creates a Future that completes immediately.

Future<String> fetchUserOrder3() => Future.error(Exception('Out of milk'));
/* NOTE:
 `Future.delayed()`, `Future.value()` and `Future.error()` are the most
 common kinds of Futures that will most likely be used in practice.
 - When you're designing a Future-based API, but you're not yet ready to 
 write the final code, in this case, you can use `Future.error()`, and
 use `UnimplementedError()` as a placeholder.
 - you can also use `Future.error()` or `Future.value()` when you're 
 writing unit tests for your asynchronous code (classes that 
 contain Future-based APIs).*/

Future<void> main() async {
  print('Program started');

  /*  fetchUserOrder()
      .then((order) => print('Order is ready: $order'))
      .catchError((error) => print(error))
      .whenComplete(() => print('Done')); */

  /*- The `then()` method gives us the result of `fetchUserOrder()` 
   inside an anonymous function (callback).
  - The `whenComplete()` method helps us to run some code when the future 
  completes, regardless of  whether it returned a value, or threw an error.
  - The code above works but it is not very practical, because if we need to
  execute multiple futures sequentially, then it will be hard to follow  
  the flow of execution because we would have to do a lot of nesting which  
  would quickly end up with code that is hard to read and reason about. */

  /* Note:
  So, if we need to execute multiple futures sequentially, `async` and 
  `await` solve it by making it easy. */

  // final order = fetchUserOrder(); // This returns an uncompleted Future

  /* To get the actual order, we need to `await` for the Future to complete.
  But if we want to use `await` inside a function, we must do so by adding 
  the `async` keyword before the function body (`main()` in this case). 
  Also, whenever you mark a function or method with `async`, then you 
  should also make its return type a `Future<type>`.*/

  try {
    final order = await fetchUserOrder();
    /* `await`s until the Future completes and returns its value. */
    print(order);
    /* We can execute multiple Futures sequentially using the `await`
    keyword: */
    final order2 = await fetchUserOrder();
    print(order2);
    final order3 = await fetchUserOrder2();
    print(order3);
    final order4 = await fetchUserOrder3();
    print(order4);
  } catch (e) {
    print(e);
  } finally {
    print('Done');
    /* This will get executed after all the Futures have completed, 
    regardless of whether they succeeded or not. */
  }
  print('After the Futures');

  /* NOTE:
  - Use `await` to wait until a Future completes and returns a value
  if successful.
  - Use multiple awaits to run Futures in sequence.
  - `await` is only allowed inside `async` functions.
  - Use `try-catch` blocks to handle exceptions thrown by Futures.
  - `async/await` + `try-catch` is a great way of working with Futures in Dart
  which is much better than `future.then(...).catchError(...).whenComplete(...);*/
}
