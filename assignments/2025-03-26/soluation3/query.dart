class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    // TODO: implement toString
    return 'Trader{name : $name, city : $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  @override
  String toString() {
    // TODO: implement toString
    return 'Transaction{trader : ${trader.toString()}, year : $year, '
        'value : $value}';
  }

  Transaction(this.trader, this.year, this.value);
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];
