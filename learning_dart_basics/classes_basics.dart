/*1. "Classes" can be used to define new types.

"Built-in types" can't always be used to model the data we need e.g., a shopping cart, a bank account, a line between two points, etc. These are complex concepts that are hard to model using the conventional built-in types, but Classes can be used to model these concepts.

Classes can be seen as "containers that hold some data along with the functionality for manipulating that data". They are the basis of object-oriented programming which give us a good way to encapsulate the state of our programs.
 */

//2. Creating a new `class` that can be used to model a `Bank Account`:
class BankAccount {
  double balance = 0; //7. `balance` is a "property" of the `BankAccount` class.

  //12. Creating an "instance method" of the class to model a behavior:
  void deposit(double amount) {
    balance += amount;
    print('Done.');
  }

  //15. Creating a second instance method to model another behavior:
  bool withdraw(double amount) {
    if (balance > amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}

//3. To use a `class`, you create an "instance" of that class.
//6. Variables declared inside a class are known as "member variables/properties".
//9. We can create multiple instances of a given class.
//17. "Instance methods" of a class can access "Properties/member variables" of the class.

void main(List<String> args) {
  final bankAccount = BankAccount(); //4. An instance of the class, `BankAccount`.
  print('--1--');
  print(bankAccount.balance); //5. Accessing/reading the `balance` variable or property declared inside the class using the dot-access `.` operator, and printing it.

  bankAccount.balance = 100; //8. Setting the value of the `balance` property for `bankAccount` instance.
  print('--2--');
  print(bankAccount.balance);

  final bankAccount2 = BankAccount(); //10. Creating another instance of the `BankAccount` class.
  bankAccount2.balance = 50;
  print('--3--');
  print(bankAccount2.balance);
  //11. We now have two completely separate instances of the `BankAccount` class.

  print('--4--');
  bankAccount.deposit(50); //13. Accessing the `deposit` method declared inside the class.
  print(bankAccount.balance); //14. Printing the new balance

  //16.
  final success1 = bankAccount.withdraw(50);
  print('--5--');
  print('success: $success1, balance: ${bankAccount.balance}');
  final success2 = bankAccount.withdraw(100);
  print('--6--');
  print('success: $success2, balance: ${bankAccount.balance}');
}
