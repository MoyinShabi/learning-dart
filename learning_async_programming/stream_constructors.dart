void main(List<String> args) {
  Stream.fromIterable([1, 2, 3]);
  // Creating a `Stream` from an `Iterable`
  Stream.value(10);
  // Creating a `Stream` that contains a single value
  Stream.error(Exception('Something went wrong'));
  // Creating a `Stream` that emits an error
  Stream.empty();
  // Creating an empty `Stream`
  Stream.fromFuture(Future.delayed(
    Duration(seconds: 1),
    () => 50,
  ));
  // Creating a `Stream` from a `Future` that emits only one value after a delay
  Stream.periodic(
    Duration(seconds: 1),
    (index) => index,
  );
  //Creating a `Stream` that emits events periodically
}
