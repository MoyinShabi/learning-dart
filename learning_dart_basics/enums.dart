enum Suits {
  hearts,
  diamonds,
  clubs,
  spades,
}

void main() {
  Suits suit =
      Suits.clubs; //Assigns the enum value to the variable of type `Suits`
  print(suit); //Suits.clubs

  //To get the name of the enum value
  print(suit.name); //clubs

  //To get all the enum values:
  print(
      Suits.values); //[Suits.hearts, Suits.diamonds, Suits.clubs, Suits.spades]

  //To get an enum value by name given its string representation:
  print(Suits.values.byName("spades")); //Suits.spades

  //To get an enum value by index:
  print(Suits.values[0]); //Suits.hearts
}
