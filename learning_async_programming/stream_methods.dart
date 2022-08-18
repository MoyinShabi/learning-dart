Future<void> main(List<String> args) async {
  final stream = Stream.fromIterable([1, 2, 3]);

  // final value1 = await stream.first;
  // print(value1); // 1

  await stream.forEach((element) => print(element * 2));

  final doubles = stream.map((event) => event * 2).where((event) => event > 3);
  // print(doubles);
  await doubles.forEach(print);

  // These methods create a `StreamSubscription`.

  // TODO: Implement some of the `Stream` methods with a `for` loop.

  /* NOTE:
  - Once you have a stream that is created from an `Iterable` or a 
  `Stream` generator, you can only call one out of the various `Stream`
  methods that are available. 
  If we try to call more than one method on the same, single subscription
  `Stream`, we get an `Unhandled exception`.
  
  - In Dart, there are two types of `Stream`s:
    - Single Subscription Streams
    - Broadcast Streams
  To NOTE: If you have a single subscription stream, you only can call 
  one of the available methods on it, otherwise you will get an error.*/
}
