/*- A "Local scope" is a block of code that is defined inside curly braces `{}`,
and it can contain multiple statements.
- As long as we try to use a variable within the current scope or within 
a parent scope(`main` function), then our code is valid 
- We can declare multiple variables with the same name as long as they 
belong to different scopes.

- A "Global scope" lives outside the `main` function and we can use it to
declare variables, functions, enums, and other types.
*/

// INNER FUNCTIONS(NESTED FUNCTIONS)
const globalVar = 20; //

void main() {
  const a = 10;
  print(globalVar);
  print(a);
  void foo(int a, int b) {
    print(globalVar);
    print(b);
    print(a);
    void bar(int c) {
      print(globalVar);
      print(a);
      print(b);
      print(c);
    }

    bar(3);
  }

  foo(1, 2);
}
