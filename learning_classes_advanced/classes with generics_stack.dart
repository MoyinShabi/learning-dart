// Recall that generics give us a way to write code that is more reusable because it can work on different types. The same concepts apply when we work with classes.

/* NOTE: 
A `Stack` is a data structure that is used in many computer science applications, and we can use it to `push` and `pop` values.
`push` an item into the stack: a new value is added at the top of the stack.
`pop` an item from the stack: the most recent value is removed from the top of the stack. */

// Implementing a class that represents a Stack using generics, using a `List` as internal storage:
class Stack<T> {
  final List<T> _items = [];

  void push(T item) => _items.add(item);

  T pop() => _items.removeLast();
}
// This is a good example of composition which is a very important design pattern.

void main(List<String> args) {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  print(stack.pop());
  print(stack.pop());
  final names = Stack<String>();
  names.push('Moyin');
  names.push('Temi');
}
