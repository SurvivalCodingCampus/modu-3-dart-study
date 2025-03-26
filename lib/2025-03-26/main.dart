import '../game/hero.dart';

void main() {
  final heros = <Hero>{};

  final h1 = Hero(name: '슈퍼맨', hp: 100);
  final h2 = Hero(name: '슈퍼맨', hp: 100);

  heros.add(h1);
  print(heros.length);

  heros.remove(h2);
  print(heros.length);
}
