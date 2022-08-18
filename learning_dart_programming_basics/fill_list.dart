import 'dart:io';

///Doesn't work
void main() {
  List<int> list = [];
  print("Please enter a value");
  int? input = int.parse(stdin.readLineSync()!);
  list[0] = input;
  print(list);

  // for (var i = 0; i < 5; i++) {
  //   print("Please enter a value");
  //   int? input = int.parse(stdin.readLineSync()!);
  //   list[i] = input;
  //   print(list);
  // }
}
