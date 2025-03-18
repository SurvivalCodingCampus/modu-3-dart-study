import 'package:modu_3_dart_study/2025-03-14/hero.dart';

void main() {
  final SuperHero superHero = SuperHero(name: 'name', hp: 100);
  superHero.run();
}

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp}); // Hero 생성자 내려받음(필수!)

  // Hero 클래스의 run() 메서드를 오버라이드
  @override
  void run() {
    super.run(); // 부모꺼 가져오기
    print('$name (슈퍼히어로)가 빠르게 도망간다! 하하');
  }
}
