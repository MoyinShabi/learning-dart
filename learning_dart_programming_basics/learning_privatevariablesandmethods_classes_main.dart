import 'learning_privatevariablesandmethods_classes.dart';

void main(List<String> args) {
  final bankAccount = BankAccount(200);
  print(bankAccount.balance);
  bankAccount.withdraw(79);
  print(bankAccount.balance);
  bankAccount.deposit(60);
  print(bankAccount.balance);
}
