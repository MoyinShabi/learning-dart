//  Flow with Pseudo code:
/*
 while true
  Show prompt
  Read user input from console
  If input is a valid move("r", "p", "s")
    Print user input
    Choose the AI move at random
    Compare the player move with the AI move
    Show the result
 else if input is "q"
    Quit the program
 else 
    Invalid input
*/

import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  final rng = Random();

  while (true) {
    stdout.write("Rock/Paper/Scissors? (r/p/s) ");
    final input = stdin.readLineSync();
    if (input == "r" || input == "p" || input == "s") {
      Move playerMove;

      if (input == "r") {
        playerMove = Move.rock;
      } else if (input == "p") {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }

      final random = rng.nextInt(3);
      final aiMove = Move.values[random];

      print("Your move: ${playerMove.name}");
      print("AI move: ${aiMove.name}");

      //Game Logic
      if (playerMove == aiMove) {
        print("\"It's a draw!\"");
      } else if (playerMove == Move.rock && aiMove == Move.scissors ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissors && aiMove == Move.paper) {
        print("\"You win!\"");
      } else {
        print("\"You lose!\"");
        //This is valid because `if...else if...else` statements are "mutually exclusive", and it will only get executed if I'ts not a draw or if the player doesn't lose.
      }
    } else if (input == "q") {
      print("Quitting...");
      break;
    } else {
      print("Invalid input!");
    }
  }
}
