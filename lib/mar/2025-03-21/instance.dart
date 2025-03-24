import 'package:modu_3_dart_study/mar/2025-03-17/hero2.dart';

void main() {
  Object object = Object();

  Hero hero = Hero(name: 'name', hp: 5);
  print(hero);

  object = hero;

  final heroes = <Hero>[];

  final h1 = Hero(name: 'tt', hp: 100);
  final h2 = Hero(name: 'tt', hp: 100);

  heroes.add(h1);
  heroes.remove(h2);
  print(h1 == h2);
  print(heroes.length);

  print(h1.hashCode);
  print(h2.hashCode);

  int num1 = 100;
  int num2 = 100;

  print(num1.hashCode);
  print(num2.hashCode);
}
