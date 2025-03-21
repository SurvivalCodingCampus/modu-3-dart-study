// 유닛의 기본 속성을 가진 추상 클래스
abstract class Unit {
  String name;
  int hp;
  int mineral;

  Unit(this.name, this.hp, this.mineral);

  void showInfo() {
    print("[$name] HP: $hp, Mineral: $mineral");
  }
}

// 기계 유닛 추상 클래스
abstract class MechUnit extends Unit {
  MechUnit(super.name, super.hp, super.mineral);
}

// 치유 가능한 유닛을 위한 인터페이스
abstract class IHealable {
  void heal(int amount);
}

// 치유할 수 있는 능력을 가진 유닛 (인터페이스)
abstract class IHealer {
  void restoration(IHealable target);
}

// 특수 기능을 위한 인터페이스
abstract interface class ISpecialSkill {
  void useSkill();
}

// 보병 유닛 (생체 유닛)
abstract class BioUnit extends Unit implements IHealable {
  BioUnit(super.name, super.hp, super.mineral);

  @override
  void heal(int amount) {
    hp += amount;
    print("$name: 체력 $amount 회복! 현재 HP: $hp");
  }
}

// Marine (보병 유닛, 치유 가능, 스팀팩 사용 가능)
class Marine extends BioUnit implements ISpecialSkill {
  Marine() : super("Marine", 40, 50);

  @override
  void useSkill() {
    print("Marine: 스팀팩 사용! HP 10 감소");
    hp -= 10;
  }
}

// Medic 클래스 (MP 추가)
class Medic extends BioUnit implements IHealer {
  int mp;

  Medic() : mp = 50, super("Medic", 60, 75);

  @override
  void restoration(IHealable target) {
    if (mp >= 10) {
      print("Medic: 대상 치유 중...");
      target.heal(20);
      mp -= 10;
    } else {
      print("Medic: MP가 부족하여 치유 불가능!");
    }
  }

  @override
  void showInfo() {
    print("[$name] HP: $hp, MP: $mp, Mineral: $mineral");
  }
}

// Tank 클래스
class Tank extends MechUnit implements ISpecialSkill {
  Tank() : super("Tank", 150, 150);

  @override
  void useSkill() {
    print("Tank: Siege Mode 활성화!");
  }
}

// Vulture 클래스
class Vulture extends MechUnit implements ISpecialSkill {
  Vulture() : super("Vulture", 80, 75);

  @override
  void useSkill() {
    print("Vulture: Spider Mine 배치!");
  }
}

// SCV 클래스
class SCV extends MechUnit {
  SCV() : super("SCV", 60, 50);

  void getMineral() {
    print("SCV: 미네랄 채집 중...");
  }
}

// 메인 실행 함수
void main() {
  Marine marine = Marine();
  Medic medic = Medic();
  Tank tank = Tank();
  Vulture vulture = Vulture();
  SCV scv = SCV();

  List<Unit> units = [marine, medic, tank, vulture, scv];

  // 유닛 정보 출력
  for (var unit in units) {
    unit.showInfo();
  }

  print("\n=== 특수 능력 사용 ===");
  marine.useSkill();
  medic.restoration(marine);
  tank.useSkill();
  vulture.useSkill();
  scv.getMineral();

  print("\n=== 능력 사용 후 상태 ===");
  marine.showInfo();
  medic.showInfo();
}