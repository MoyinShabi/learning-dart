/* A `Stream` is a sequence of asynchronous events, and it can be
thought of as an asynchronous `Iterable`, where events are delivered
over time, rather than when you ask for them. 

In Dart, there are various ways to create and add items to a `Stream`:
- To generate a Stream from an `Iterable: `Stream.fromIterable`
- To use a Stream generator, which is a function that uses the `async*`
and `yield` keywords.
- To use a `StreamController` which gives us more control about how we 
add items to the Stream.*/

/* Function to calculate the sum of items in the `Stream`, `stream`
 below. Because the stream emits values asynchronously (emits "one" 
 value at a time), the function returns a `Future<int>`*/
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  /* It's important to use `await for` because we're working with a `Stream`
  and we need to `await` for each `value` to be available before we can use it.*/
  return sum;
}

Future<int> sumStream2(Stream<int> stream) =>
    stream.reduce((previous, element) => previous + element);
/*This syntax is identical to what we would write if we were using
  an `Iterable`, but what happens under the hood is that the `Stream.reduce` 
  method will wait for each event in the stream to become available 
  before calling the `combine` function. And since the `sumStream2()` 
  function returns a `Future` and `stream.reduce` also returns a `Future`,
  then we don't need a pair of `async/await` keywords, and we can just 
  return the expression as done. 
*/

// Learning Stream Generators
Stream<int> countStream(int n) async* {
  for (var i = 1; i <= n; i++) {
    // For e.x, here, some asynchronous work in a real world application which we will need to `await` for the result.
    // Adding a delay so that all the Stream items are not generated at the same time:
    await Future.delayed(
      Duration(seconds: 1),
      () => print(i),
    );
    // Using a Future to simulate a delay
    // print(i); // Generates items with a delay, one by one
    yield i; // Calling `yield` multiple times to "generate" a `Stream`
  }
}
/* What this code does is to "generate" multiple values (from 1 to `n`) 
and use them to create a Stream.

NOTE: Stream generators are quite useful because we can use them to 
emit multiple values over time, inside a single function.

NOTE: The main idea is that you can use `yield` to generate a single 
asynchronous value that will be added to the stream that is returned 
by the function. 
- So rather than having a function that returns a "single value", you're 
generating many asynchronous values and "putting them inside a stream" 
that can be listened to.
- In the majority of use cases you're more likely to consume/listen to 
streams from 3rd party APIs rather than generating the data that goes
inside them. */

// Synchronous Generators
Iterable<int> count(int n) sync* {
  for (var i = 1; i <= n; i++) {
    yield i;
  }
}

/*`Iterable` and `Stream` are very similar, such that:
- They can be iterated over with a `for` loop.
- They can be generated with generator functions e.g, `count()`
and `countStream()` above.
- They share many methods to process and modify items. 

But they have one fundamental difference:
- `Iterable`s are "synchronous" and `Stream`s are "asynchronous".  */

Future<void> main(List<String> args) async {
  // Generating a `Stream` from an `Iterable`:
  final stream = Stream<int>.fromIterable([1, 2, 3, 4]);
  // final sum = await sumStream(stream);
  final sum = await sumStream2(stream);
  print('Sum: $sum');

  final generatedStream = countStream(5);
  // This generates a Stream with all the values from 1 to 5.

  final sum2 = await sumStream2(generatedStream);
  print('Sum: $sum2');
}
