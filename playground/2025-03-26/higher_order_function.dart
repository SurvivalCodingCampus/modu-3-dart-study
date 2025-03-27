import 'dart:math';

const items = [1, 2, 3, 4, 5];

// 조건 필터링: 짝수만 출력
void where() {
  items.where((e) => e % 2 == 0).forEach(print);
}

// 변환: 짝수를 double로 변환 후 출력
void map() {
  items.where((e) => e % 2 == 0).map((e) => e.toDouble()).forEach(print);
}

void toList() {
  List<int> list = items.toList();
  print(list);
}

void toSet() {
  Set<int> set = items.toSet();
  print(set);
}

// 조건을 만족하는 요소가 하나라도 있으면 true 반환
void any() {
  bool hasEven = items.any((e) => e % 2 == 0);
  print(hasEven);
}

// 초기값을 지정하고 요소를 누적하여 계산
int fold() {
  return items.fold(10, (prev, next) => prev + next);
}

// 요소를 줄여가며 하나의 값으로 축약
int reduce() {
  return items.reduce(max); // 최댓값 찾기
}

void main() {
  where();
  map();
  toList();
  toSet();
  any();

  print(reduce());
  print(fold());
}
