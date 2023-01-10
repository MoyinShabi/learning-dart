void main() {
  //Learning the substring() method
  const string = 'dartlang';
  var result1 = string.substring(1); //artlang
  var result2 = string.substring(1, 4); //art
  //Arguments in the parenthesis are indexes of the string
  var result3 = string.substring(1, 8); //artlang
  var result4 = string.substring(0, 1); //d
  var result5 = string.substring(0, 4); //dart
  var result6 = string.substring(4, 8); //lang
  print(result1);
  print(result2);
  print(result3);
  print(result4);
  print(result5);
  print(result6);

  //Learning the split() method
  const splitString1 = 'Hello world!';
  final split1 = splitString1.split(' ');
  print(split1); // [Hello, world!];
  const splitString2 = 'Helloworld!';
  final split2 = splitString2.split(' ');
  print(split2); // [Helloworld!];
  const splitString3 = 'Hello world';
  print(splitString3.split('')); // [H, e, l, l, o,  , w, o, r, l, d]
  const splitString4 = 'Helloworld';
  print(splitString4.split('')); // [H, e, l, l, o, w, o, r, l, d]
  const splitString5 = 'Hello, world';
  print(splitString5.split(',')); // [Hello,  world]
  const splitString6 = 'Hello,world';
  print(splitString6.split(',')); // [Hello, world]
}
