// A, B의 인스턴스를 각각 하나씩 생성 List에 차럐로 담는다.
//List의 요소를 차례대로 꺼래 -> forEach -> 인스턴스의 b()메소드 호출
//List 변수의 타입?

import 'practice.dart';

void main(List<String> arguments) {
  final instance = <Y>[A(), B()];

  instance.forEach((instance) {
    instance.b();
  });
}
