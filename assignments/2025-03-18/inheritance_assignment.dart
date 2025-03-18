class Hero {
  static const int maxHp = 1000;

  String name;
  int hp;
  Hero(this.name, this.hp) {
    print('Hero $name 생성');
  }
}

class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임 $suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

// PoisonSlime 는 아래의 코드로 인스턴스화 되는 클래스임
// PoisonSlime poisonSlime = PoisonSlime(‘A’);

// PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5)를 가진다

// PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다
// 우선, “보통 슬라임과 같은 공격"을 한다
// poisonCount가 0이 아니면 다음을 추가로 수행한다
// 화면에 “추가로, 독 포자를 살포했다!” 를 표시
// 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
// poisonCount 를 1 감소 시킨다

class PoisonSlime extends Slime {
  int poisonCount = 5;
  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      int poisonDmg = (hero.hp * 4) ~/ 5;
      hero.hp -= poisonDmg;
      print('$poisonDmg포인트의 데미지!');
      poisonCount -= 1;
    }
  }
}

class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
    : _name = name.length > 2 ? name : throw Exception('이름은 3글자 이상이여야 합니다.'),
      _power =
          (power >= 0.5 && power <= 100.0)
              ? power
              : throw Exception('마력은 0.5이상 100.0 이하여야합니다.');

  String get name => _name;

  double get power => _power;

  set name(String value) {
    if (value.length > 2) {
      _name = value;
    } else {
      throw Exception("이름은 3글자 이상이여야 합니다.");
    }
  }

  set power(double value) {
    if (value >= 0.5 && value <= 100.0) {
      _power = value;
    } else {
      throw Exception('마력은 0.5이상 100.0 이하여야합니다.');
    }
  }
}

// 속성:
// mp: Int (초기값 100)
// 메서드:
// heal(hero: Hero): Unit의 hp를 20 회복시키고 자신의 mp를 10 소모
// mp가 부족하면 "마나가 부족합니다" 출력
// 힐을 성공하면 "힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;
  Wizard({required String name, required int hp, int? mp, Wand? wand})
    : _name = (name.length > 1) ? name : throw Exception("이름은 2글자 이상이여야 합니다."),
      _hp = (hp < 0) ? 0 : hp,
      _mp = mp ?? 100,
      _wand = wand;

  void heal({required Hero hero}) {
    if (_mp < 10) {
      print('마나가 부족합니다');
    } else {
      _mp -= 10;
      hero.hp += 20;
      print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  set name(String value) {
    if (value.length > 1) {
      _name = value;
    } else {
      throw Exception("이름은 2글자 이상이여야 합니다.");
    }
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('mp는 0이상이여야 합니다.');
    } else {
      _mp = value;
    }
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 null로 설정할 수 없습니다.');
    } else {
      _wand = value;
    }
  }
}

class GreatWizard extends Wizard {
  static int baseMp = 150;

  GreatWizard({required super.name, required super.hp, int? mp, super.wand})
    : super(mp: mp ?? baseMp);

  //이렇게하면 Wizard에서 mp에 100이 할당된 뒤에 다시 150을 할당하게됨.
  // {
  //   _mp = mp?? baseMp;
  // }

  void superHeal({required Hero hero}) {
    if (_mp < 50) {
      print('마나가 부족합니다');
    } else {
      _mp -= 50;
      hero.hp = Hero.maxHp;
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }
}
