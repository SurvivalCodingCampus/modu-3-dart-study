import 'dart:math';

void main() {
  // // 1급 객체 : 변수에 대입할 수있는 객체
  // String name = '이지롱';
  // int num = 10;
  // int Function(int, int) myFounction = sum;

  // // 발생할 수 있는 문제!
  // // Function myFounction2 = sum; // dynamic 으로 처리 되어서 꼬여 버림! 꼭 자료형 명시!
  // // myFounction2('a', 'b'); // 컴파일에서 되면 안되는데 되어 버림! -> 실행하면 TypeError 발생

  // List<int> nums = [1, 2, 3];

  // nums.forEach(printElement);
  // nums.forEach((int value) {
  //   print(value);
  // });

  //고계함수
  myHigherOderFunction((value) {
    print('$value: 화이팅');
  });

  final items = [1, 2, 3, 4, 5];

  // 짝수 판별
  // where함수
  for (var i = 0; i < items.length; i++) {
    if (items[i] % 2 == 0) {
      print(items[i]);
    }
  }
  items.where((e) => e % 2 == 0).forEach(print);
  // map 함수
  for (var i = 0; i < items.length; i++) {
    if (items[i] % 2 == 0) {
      print('숫자 ${items[i]}');
    }
  }
  items.where((e) => e % 2 == 0).map((e) => '숫자 $e').forEach(print);

  // toList()
  List<int> toListList = items.where((e) => e % 2 == 0).toList();
  print(toListList);

  // toSet()
  // 중복을 허용하지 않기 때문에 간단히 중복데이터를 제거할 수 있음
  final items1 = [1, 2, 2, 3, 3, 4, 5];
  var result = [];
  var temp = <int>{};
  for (var i = 0; i < items1.length; i++) {
    if (items1[i] % 2 == 0) {
      temp.add(items1[i]);
    }
  }
  result = temp.toList();
  print(result); //2,4

  final toSetResult = items1.where((e) => e % 2 == 0).toSet().toList();
  print(toSetResult);

  // any
  var boolResult = false;
  for (var i = 0; i < items.length; i++) {
    if (items[i] % 2 == 0) {
      boolResult = true;
      break;
    }
  }
  print(boolResult);

  print(items1.any((e) => e % 2 == 0));

  // reduce
  var maxResult = items[0];
  for (var i = 0; i < items.length; i++) {
    maxResult = max(items[i], maxResult);
  }
  print(maxResult);

  print(items.reduce((v, e) => max(v, e)));
}

void printElement(int value) {
  print(value);
}

int sum(int a, int b) => a + b;

// 파라미터로 함수 받기
void myHigherOderFunction(void Function(String) func) {
  print('시작!');
  func('이지롱');
  print('함수 끝');
}
