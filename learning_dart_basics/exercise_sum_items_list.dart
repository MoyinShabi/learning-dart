void main() {
  var listOfIntegers = [1, 3, 5, 7, 9];

  //Printing out the sum of the values in the list:
  var sum = 0;
  for (var value in listOfIntegers) {
    sum += value;
  }
  print("The sum is $sum");

  // OR
  // var sum = 0;
  // for (var i = 0; i < listOfIntegers.length; i++) {
  //   sum = sum + listOfIntegers[i];
  // }
  // print("The total is: $sum");

  //OR
  // var sum = listOfIntegers.reduce((i, j) => i + j);
  // print("The sum is $sum");
}
