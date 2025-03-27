import 'dart:math';

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

  @override
  String toString() {
    return 'Transaction{trader: ${trader.name}, ${trader.city}, year: $year, value: $value}';
  }
}

void main() {
  final List<Transaction> transactions = [
    Transaction(Trader("Brian", "Cambridge"), 2011, 300),
    Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
    Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
    Transaction(Trader("Mario", "Milan"), 2012, 710),
    Transaction(Trader("Mario", "Milan"), 2012, 700),
    Transaction(Trader("Alan", "Cambridge"), 2012, 950),
  ];
  //1번 문제
  List<Transaction> sortedTransaction =
      transactions.where((transactions) => transactions.year == 2011).toList()
        ..sort((a, b) => a.value.compareTo(b.value));
  print(sortedTransaction);
  print('------------------------------');
  //2번 문제
  List<String> cityName =
      transactions
          .map((transactions) => transactions.trader.city)
          .toSet()
          .toList();
  print(cityName);

  print('------------------------------');
  //3번 문제
  List<Transaction> nameSortedTransaction =
      transactions
          .where((transactions) => transactions.trader.city == "Cambridge")
          .toSet()
          .toList()
        ..sort((a, b) => a.trader.name.compareTo(b.trader.name));
  print(nameSortedTransaction);
  print('------------------------------');
  //4번 문제
  List<String> nameSortedByAlphabet =
      transactions
          .map((transactions) => transactions.trader.name)
          .toSet()
          .toList();
  nameSortedByAlphabet.sort();
  print(nameSortedByAlphabet);
  print('------------------------------');
  //5번 문제 밀라노에 구매자 존재
  bool checkMilan = transactions
      .map((transactions) => transactions.trader.city)
      .any((transactions) => transactions == 'Milan');
  print(checkMilan);
  print('------------------------------');
  //6번 문제
  List<Transaction> livingCambridge =
      transactions.where((e) => e.trader.city == "Cambridge").toList();
  print(livingCambridge);
  print('------------------------------');
  //7번 문제 트랜잭션 중 최대값
  int maxTransaction = transactions
      .map((transactions) => transactions.value)
      .reduce(max);
  print(maxTransaction);
  print('------------------------------');
  //8번 문제 트랜잭션 중 최소값
  int minTransaction = transactions
      .map((transactions) => transactions.value)
      .reduce(min);
  print(minTransaction);
}
