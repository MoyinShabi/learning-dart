void main() {
  outerloop: // This is the label name for the outer loop
  for (var i = 0; i < 5; i++) {
    print("Innerloop: $i");
    innerloop: //This is the label name for the inner loop
    //This loop has to end before the next iteration of the outer loop
    for (var j = 0; j < 5; j++) {
      if (j > 3)
        break; //This stops this loop regardless of whether the iterations have been completed and then allows the next iteration of the outer loop to take place

      // Quit the inner loop
      if (i == 2) break innerloop;

      //This ends the outer loop at its fourth iteration
      if (i == 4) break outerloop;

      // Quit the outer loop
      print("Innerloop: $j");
    }
  }
}
