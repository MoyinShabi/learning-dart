//  Flow with Pseudo code:
/*
while(true)
Generate a secret int number at random
for an iterator, i <= 6
  Show prompt
  Read user input from console and get guessed no.
  Compare the user input with secret no:
    If user input > secret no
      Print HI
   else if input < secret no.
      Print LO
   else 
      Print correct guess!
 */

import 'dart:io';
import 'dart:math';

void main() {
  final rng = Random();
  while (true) {
    final secretNo = rng.nextInt(100) + 1; //Value is >= 1 and < 101
    print("🎮 Game start");
    innerloop:
    for (var i = 1; i <= 6; i++) {
      stdout.write("Your integer number guess please: ");
      final number = stdin.readLineSync();
      final userInput = int.tryParse(number!);
      if (userInput! > secretNo) {
        print("HI");
        print("You have made $i guesses");
        continue;
      } else if (userInput < secretNo) {
        print("LO");
        print("You have made $i guesses");
        continue;
      } else {
        print("\"Correct guess!\"");
        break innerloop;
      }
    }
  }
}
