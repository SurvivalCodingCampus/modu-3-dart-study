class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

void main() {
  final transactions = [
    Transaction(Trader("Brian", "Cambridge"), 2011, 300),
    Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
    Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
    Transaction(Trader("Mario", "Milan"), 2012, 710),
    Transaction(Trader("Mario", "Milan"), 2012, 700),
    Transaction(Trader("Alan", "Cambridge"), 2012, 950),
  ];

  //1.
  print('✅1.');
  final sort2011 = transactions.where((tx) => tx.year == 2011).toList()..sort((a, b) => a.value.compareTo(b.value));
  sort2011.forEach((tx) => print('${tx.trader.name} - ${tx.value}'));
  
  //2.
  print('\n✅2.');
  transactions.map((tx) => tx.trader.city).toSet().forEach(print);

  //3.
  print('\n✅3.');
  transactions.where((tx) => tx.trader.city == 'Cambridge').map((tx) => tx.trader.name).toSet().toList()..sort()..forEach(print);

  //4.
  print('\n✅4.');
  transactions.map((tx) => tx.trader.name).toSet().toList()..sort()..forEach(print);

  //5.
  print('\n✅5.');
  print('${transactions.any((tx) => tx.trader.city == 'Milan')}');

  //6.
  print('\n✅6.');
  transactions.where((tx) => tx.trader.city == 'Cambridge').map((tx) => tx.value).forEach(print);

  //7.
  print('\n✅7.');
  print('${transactions.map((tx) => tx.value).reduce((a, b) => a > b ? a : b)}');

  //8.
  print('\n✅8.');
  print('${transactions.map((tx) => tx.value).reduce((a, b) => a < b ? a : b)}');
}