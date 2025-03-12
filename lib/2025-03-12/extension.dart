extension MyIntExtension on int {
  bool get isEven => this % 2 == 0;

  int get square => this * this;

  bool get isPrime {
    for (int i = 2; i < this; i++) {
      if (this % i == 0) {
        return false;
      }
    }

    return true;
  }

  int multiple(int x) {
    return this * x;
  }
}

extension MyStringExtension on String {
  String addWorld() => '$this, World';
}

void main() {
  int number = 4;
  int prime = 1009;

  print(number.isEven); // true
  print(number.square); // 16
  print(number.isPrime);
  print(prime.isPrime);
  print(number.multiple(2));

  String hello = 'Hello';
  print(hello.addWorld());
}
