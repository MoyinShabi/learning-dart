void main() {
  outerloop: // This is the label name

  for (var i = 0; i < 3; i++) {
    print("Outerloop: $i");

    for (var j = 0; j < 5; j++) {
      if (j == 3) {
        continue outerloop; //This skips the rest of the running iteration in the outer loop and moves on to the next one regardless of if there are still lines of code to be executed
      }
      print("Innerloop: $j");
    }
  }
}
