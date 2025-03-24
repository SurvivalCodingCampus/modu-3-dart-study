class Cleric {
  static int maxHp = 50;
  static int maxMp = 50;
  String name;
  int hp;
  int mp;

  Cleric({required this.name, int? hp, int? mp})
    : hp = hp ?? maxHp,
      mp = mp ?? maxMp;
}
