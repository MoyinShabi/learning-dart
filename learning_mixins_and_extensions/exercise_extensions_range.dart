extension RangeTo on int {
  List<int> rangeTo(int other) {
    var list = [this];
    if (other < this) {
      return [];
    }

    for (var i = this + 1; i <= other; i++) {
      list.add(i);
    }
    return list;
  }
}

void main() {
  for (var i in 1.rangeTo(5)) {
    print(i);
  }
  print(2.rangeTo(8));
  print(3.rangeTo(1));
}
