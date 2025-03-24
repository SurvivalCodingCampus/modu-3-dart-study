import 'package:modu_3_dart_study/PR2025-03-18/hero.dart';

void main() {
  Hero hero = Hero(name: 'name', hp: 100);
  // print(hero);
  //
  // final heroes = <Hero>[];
  // final h1 = Hero(name: '슈퍼맨', hp: 100);
  // final h2 = Hero(name: '슈퍼맨', hp: 100);
  // heroes.add(h1);
  // print(heroes.length);
  // heroes.remove(h2);
  // print(heroes.length);
  final names = ['김현수', '이지금', '박미자'];
  names.sort((a, b) => a.compareTo(b));
  print(names);
  names.sort((a, b) => a.compareTo(b) * -1);
  print(names);
}
