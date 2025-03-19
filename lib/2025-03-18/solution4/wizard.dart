import '../core/hero.dart';
import 'wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;

  static const int defaultMaxHp = 50;

  //FIXME: 추가 예정
  // final int _maxHp;

  // 기본 MP 값과 마법사 고유 MP값 (변경된 경우를 위해 추가하였음)
  static const int defaultMaxMp = 100;
  final int _maxMp;

  static const int defaultSkillPtHeal = 10;

  Wand? _wand;

  // 생성자
  Wizard({
    required String name,
    int hp = defaultMaxHp,
    int mp = defaultMaxMp,
    int? maxMp,
    Wand? wand,
  }) : _name = name,
       _hp = hp,
       _mp = mp,
       _maxMp = maxMp ?? defaultMaxMp,
       _wand = wand {
    _validateName(name);
    _validateHp(hp);
    _validateMp(mp);

  }

  //------- Skills
  void heal(Hero hero, {int healPt = 20}) {
    if (mp < Wizard.defaultSkillPtHeal) {
      print('마나가 부족합니다 (현재마나 : $mp)');
      return;
    }

    // set 유효성 검사에 최대값을 초과하지 않도록 검사 로직 추가
    int resultHp = hero.hp + healPt;
    if (resultHp > Hero.maxHp) resultHp = Hero.maxHp;

    // 체력 회복
    hero.hp = resultHp;

    // 마나 감소 (음수값 유효성 검사)
    int resultMp = mp - defaultSkillPtHeal;
    mp = resultMp > 0 ? resultMp : 0;

    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }



  //------- Name setter & getter
  String get name => _name;

  set name(String value) {
    _validateName(value);
    _name = value;
  }

  //------- Hp setter & getter
  int get hp => _hp;

  set hp(int value) {
    if (value < 0) {
      _hp = 0; // 음수일 경우 0으로 설정
    } else {
      _validateHp(value);
      _hp = value;
    }
  }

  //------- Mp setter & getter
  int get mp => _mp;

  set mp(int value) {
    _validateMp(value);
    _mp = value;
  }

  //------- Wand setter & getter
  Wand? get wand => _wand;

  set wand(Wand? value) {
    if (_wand != null && value == null) {
      throw Exception("마법사는 지팡이를 null로 설정할 수 없습니다");
    }
    _wand = value;
  }

  // 예외 처리 함수
  void _validateName(String name) {
    if (name.length < 3) {
      throw Exception("마법사 이름은 3자 이상이어야 합니다.");
    }
  }

  void _validateHp(int hp) {
    if (hp < 0) {
      throw Exception("HP는 0 이상이어야 합니다.");
    } else if (hp > defaultMaxHp) {
      throw Exception("HP는 최대 $defaultMaxHp를 초과할 수 없습니다.");
    }
  }

  void _validateMp(int mp) {
    if (mp < 0) {
      throw Exception("MP는 0 이상이어야 합니다.");
    } else if (mp > _maxMp) {
      throw Exception("MP는 최대 $_maxMp를 초과할 수 없습니다.");
    }
  }
}
