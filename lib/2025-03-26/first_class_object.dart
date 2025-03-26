void main() {
  String name = '홍길동';
  int num = 10;
  int Function (int, int) myFunction = sum;

  Function myFunction2 = sum;

  List<int> nums = [1, 2, 3];

  // 1+2, 3
  // 3+3
  // 6
  final result = nums.reduce((v, e) {
    print('$v, $e');
    return v + e;
  });

  nums.forEach(printElement); // input, output 같으면 이렇게 사용 가능.

  //String Function(dynamic) 좋은 상황은 아닌데 아무튼 사용가능함.
  // 임시로 빨리빨리 쓰려고 하는 것.
  var loudify = (msg) => '111111';
}

void printElement(int value) {
  print(value);
}

int sum(int a, int b) => a + b;