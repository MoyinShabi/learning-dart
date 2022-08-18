// Class "constructors" are used to initialize class member variables or properties i.e., to add default values to class member variables.

class BankAccount {
//19. Adding a "default" class constructor to initialize the `balance` class property with the value of the `balance` argument in the constructor:
  BankAccount(double balance, String accountHolder) {
    this.balance = balance; // This tells Dart that the class member variable or property, `balance`, should be initialized with the value of the `balance` argument in the constructor.
    this.accountHolder = accountHolder;

    // The `this` keyword is used to disambiguate between variables of the same name.
  }

  double balance = 0;
  String accountHolder = 'Mo';

  void deposit(double amount) {
    balance += amount;
    print('Done.');
  }

  bool withdraw(double amount) {
    if (balance > amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}

//Note: There are better and simpler ways of initializing member variables as shown below.

// Using an "initializer list" to initialize member variables with a class constructor:
class BankAccount2 {
  BankAccount2({
    double balance = 0,
    required String accountHolder, // We have two constructor arguments to initialize the class member variables.
  })  : balance = balance,
        accountHolder = accountHolder;
  // We use this initializer list (syntax-> ` : assignment 1, assignment2;) to assign the constructor arguments to the class member variables. Though they have the same name in each case, Dart is smart enough to know which is which in the initializer list (left of assignment operator is member variable, right is constructor argument).

  String accountHolder;
  double balance;

  void deposit(double amount) {
    balance += amount;
    print('Done.');
  }

  bool withdraw(double amount) {
    if (balance > amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}
// The initializer list in the class constructor above is quite verbose because the variable names are repeated too many times. This can be fixed with a short hand syntax.

// "Short hand syntax" to achieve the same result (with less code) in the declaration of the class constructor in the `BankAccount2` class above:
class BankAccount3 {
  BankAccount3({
    required this.accountHolder,
    this.balance = 0,
  });
  // By doing this, Dart uses the constructor arguments to initialize the member variables or instance variables or properties without needing to specify an initializer list by hand.

  final String accountHolder; // Making this an "immutable" variable by declaring it as `final` because `accountHolder` is something that should't change in a bank account model.
  double balance;

  void deposit(double amount) {
    balance += amount;
    print('Done.');
  }

  bool withdraw(double amount) {
    if (balance > amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}
// NOTE: In practice, the short hand syntax will be used most of the time, but initializer lists are still used in some cases.

// NOTE: By convention, class constructors are always declared before any member variables and methods.

// NOTE: The syntax for creating a class constructor is quite similar to a function declaration with the main difference being that there is no need to declare a return type. This is because by definition, class constructors are used to create and return instances of the class they belong to.

// NOTE: When you create classes that model some things that exist in the real world, you should always ask yourself if each one of the properties(member variables) should be mutable or immutable. You can declare immutable properties with `final`.

// NOTE: "Class design is type design" and you should always strive to make your types "easy to use correctly", and "hard to use incorrectly".

class BankAccount4 {
  BankAccount4(
    this.accountHolder,
    this.balance,
  );

  String accountHolder;
  double balance;

  void deposit(double amount) {
    balance += amount;
    print('Done.');
  }

  bool withdraw(double amount) {
    if (balance > amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}

void main(List<String> args) {
  final bankAccount = BankAccount(100, 'Mo');
  print('--1--');
  print(bankAccount.balance);

  final bankAccount2 = BankAccount2(accountHolder: 'Moyin Shabi', balance: 20);
  print('--2--');
  print(bankAccount2.balance);

  final bankAccount3 = BankAccount3(accountHolder: 'Temi Shabi', balance: 50);
  print('--3--');
  print(bankAccount3.balance);

  final bankAccount4 = BankAccount4('Bolu Shabi', 0);
  print(bankAccount4.balance);
}
