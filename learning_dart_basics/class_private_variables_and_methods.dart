// Private variables and methods are essential in object-oriented programming, because they allow us to "encapsulate" certain things that should not be accessible directly, outside our classes.

class BankAccount {
  BankAccount(this._balance);
  // double balance; // `public` member variable for this class.
  double _balance;
  // `private` member variable that's inaccessible outside the class (read-write inside the class and read-only outside the class).
  double get balance => _balance;
  // `public` getter variable which returns the value of the `private` `_balance` member variable. Allows us to access the `private` member variable indirectly.

  void deposit(double amount) {
    _balance += amount;
  }

  bool withdraw(double amount) {
    if (_balance > amount) {
      _balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}

void main(List<String> args) {
  final bankAccount = BankAccount(200);
  print(bankAccount._balance);
  // It can be directly accessed/updated in the same file the class is declared in but not outside.
  bankAccount._balance = 20; // Valid.
  print(bankAccount._balance);
}
