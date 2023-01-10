/* Remember that is is often better to create immutable classes that only have `final` properties. This approach leads to code that behaves in a more predictable way, because it minimizes the amount of mutable state that we have in our applications.

However, sometimes it's useful to take an instance of a certain class and make a copy if it, so that we can modify some of its properties.
 */

class Credentials {
  Credentials({this.email = '', this.password = ''});
  final String email;
  final String password;

  Credentials copyWith({String? email, String? password}) {
    return Credentials(
      email: email ?? this.email, // This uses the email passed as an argument if it is not `null` , otherwise, it uses the email from the current instance of the class.
      password: password ?? this.password, // This uses the password passed as an argument if it is not `null` , otherwise, it uses the password from the current instance of the class.
    );
  }

  @override
  String toString() => 'Credentials($email, $password)';
}

void main(List<String> args) {
  final credentials = Credentials();

// Use case: sign-in form
// Suppose that we're creating a sign-in form where the user can type in an email and a password, and we want to update these credentials' (`email` and `password` variables) object as the user types in the form.

// credentials.email = 'me@example.com'; // But because we made the variables `final`, here we're not allowed to type this and set it to some email address.

// So instead, the only thing we can do is to create a new `Credentials` instance using the values from the previous one. This is done using the `copyWith()` method defined in the `Credentials` class above. The method returns a new instance of the `Credentials` class.

// After doing so, we can now update the credentials:
  final updated1 = credentials.copyWith(email: 'me@example.com');
  print(updated1);
  // The first time we call `copyWith()`, then we're setting the email, and keeping the previous password which is empty.

  final updated2 = updated1.copyWith(password: 'too-easyyy1');
  print(updated2);
  // The second time we call `copyWith()`, then we keep the previous email, but we set the new password.
  // All this is done using only immutable objects.

  // NOTE: When you need to implement copy behavior for your immutable objects, you should implement a `copyWith()` method as done above.
  // NOTE: This is a convention that is used extensively in Flutter, especially when it comes to setting theme objects that can have dozens of properties. And what makes `copyWith()` so convenient, is that we can use it to set any properties that we like, while omitting all the others, and this is done using named arguments.
}
