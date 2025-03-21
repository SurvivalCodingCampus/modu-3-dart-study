
import '../2025-03-18/hero.dart';

void main() {
  String name = '홍길동';
  Hero hero = Hero(name: 'name', hp: 50);

  final heroes = <Hero>{};
  final h1 = Hero(name: 'name', hp: 50);
  final h2 = Hero(name: 'name', hp: 50);

  print(h1 == h2);

  heroes.add(h1);
  print(heroes.length);
  heroes.remove(h2);
  print(heroes.length);
}