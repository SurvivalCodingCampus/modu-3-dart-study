import 'trader.dart';

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return 'year : $year, value : $value, trader : $trader \n';
  }
}
