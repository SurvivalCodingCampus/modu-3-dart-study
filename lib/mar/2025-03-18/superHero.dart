import '../2025-03-17/hero2.dart';

void main() {
  final superHero = SuperHero(name: 'name', hp: 100);
  superHero.run();
}

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp});

  @override
  void run() {
    print('$name 이 뛴다');
  }
}
