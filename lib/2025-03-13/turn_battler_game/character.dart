import 'dart:math';

import 'package:modu_3_dart_study/2025-03-13/turn_battler_game/statistics.dart';

abstract class Character {
  final String name;
  late final Statistics statistics;

  Character({required this.name, required this.statistics});

  int get hp => statistics.hp;
  int get mp => statistics.mp;
  int get dex => statistics.dexterity;
  int get ap => statistics.ap;
  int get luck => statistics.luck;

  set hp(int hp) {
    statistics.hp = hp;
  }

  void attack(Character target) {
    double criticalChance = luck * 0.03;
    double criticalBase = Random().nextDouble();

    int damage = (criticalBase < criticalChance) ? ap * 3 : ap;

    target.takeAttack(damage);

    if (ap < damage) {
      print(
        '[System] $name 이(가) ${target.name}에게 크리티컬 데미지 $damage를 입혔습니다. ${target.name}의 남은 체력 ${target.hp}',
      );
    } else {
      print(
        '[System] $name 이(가) ${target.name}에게 $damage의 데미지를 입혔습니다. ${target.name}의 남은 체력 ${target.hp}',
      );
    }
  }

  void takeAttack(int ap) {
    hp = (ap > hp) ? 0 : hp -= ap;
  }
}
