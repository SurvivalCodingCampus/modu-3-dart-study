import 'dart:math';

class Statistics {
  static const double _increaseHp = 5 * 0.8;

  int maxXp;
  int xp = 0;
  int level;

  int strength;
  int dexterity;
  int intelligence;
  int charisma;
  int constitution;
  int luck;

  late int maxHp;
  late int maxMp;
  late int hp;
  late int mp;
  late int ap;

  Statistics({
    this.level = 1,
    this.maxXp = 10,
    this.strength = 5,
    this.dexterity = 5,
    this.intelligence = 5,
    this.charisma = 5,
    this.constitution = 5,
    this.luck = 5,
  }) {
    maxHp = (constitution * _increaseHp).round();
    hp = maxHp;

    maxMp = (intelligence * 10 * 2).round();
    mp = maxMp;

    ap = (strength * 0.8).round();
  }

  static Statistics random([int limit = 10]) {
    int dice() => Random().nextInt(limit) + 1;

    return Statistics(
      dexterity: dice(),
      strength: dice(),
      constitution: dice(),
      luck: dice(),
    );
  }

  @override
  String toString() {
    return 'Statistics{maxXp: $maxXp, xp: $xp, level: $level, strength: $strength, dexterity: $dexterity, intelligence: $intelligence, charisma: $charisma, constitution: $constitution, luck: $luck, maxHp: $maxHp, maxMp: $maxMp, hp: $hp, mp: $mp, ap: $ap}';
  }
}
