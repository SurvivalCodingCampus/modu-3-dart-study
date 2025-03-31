
class Wizard extends Hero implements Attackable, Healable {

  int mp = 100;

  Wizard({required super.name, required super.hp});

  @override
  void heal(Hero target) {
    print('${target.name}을 치유합니다.');
    target.hp += 20;
    mp -=20;
    print('${target.name}의 HPrk 20 회복 되었다 (현재 HP: ${target.hp})');
    print('$name의 남은 MP : $mp');
  }

  @override
  void attack(Slime slime) {
    // TODO: implement attack
    super.attack(slime);
    print('$name의 마법화살 공격');
    slime.hp -= 8;
    print('$name의 남은 MP:$mp');
  }
}
