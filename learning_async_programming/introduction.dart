/* ASYNCHRONOUS PROGRAMMING
- Nearly all modern applications support asynchronous operations 
in one form or another. These operations can't provide a result 
immediately they are started.
- Common asynchronous operations are:
  - Fetching data from the network
  - Writing to a database
  - Reading data from a file  
- In all these cases, it is important for your app or program to be 
"responsive" while waiting for asynchronous operations to complete.

- To deal with asynchrony in Dart, we can use the `Future` class 
along with the `async` and `await` keywords.
- To deal with running asynchronous operations that can produce more than
one result over time, we can use `Stream`s.
- `Stream`s: A sequence of asynchronous events that are delivered over
time. They are often used when building reactive applications that can 
update their UI when new data is available, and this is the case with
Flutter and many other modern declarative frameworks.
- `Stream` generators are created using the `async*` and `yield` keywords.*/