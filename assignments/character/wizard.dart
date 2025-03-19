import 'hero.dart';

class Wand {
  String _name;
  //power d은 0.5 <= 마력 <= 100.0
  double _power;


  Wand( this._name, this._power) {
    name = _name;
    power = _power;
  }

  // 이름은 null 이 아니고 3자 이상 이다.
  set name(String value) {
    if(value.length < 3) {
      throw Exception('지팡이 이름이 너무 짧습니다.');
    }
    _name = value;
  }

  String get name => _name;

  set power(double value) {
    if ( value < 0.5 || value > 100.0) {
      throw Exception('지팡이의 마력은 0.5 이상, 100.0 이하여야 합니다.');
    }
    _power = value;
  }
double get power => _power;

}

class Wizard {
  // 마법사의 mp는 0 이상이어야 한다.
  // hp 가 음수가 되는 상황에서  0이 설정 되도록 한다.
  String _name;
  int _hp = 100;
  int _mp = 100;
  Wand? _wand;

  Wizard(this._name, int hp, int mp, {Wand? wand}) {
    name = _name;
    this.hp = hp;
    this.mp = mp;

    if (wand != null) {
      this.wand = wand;
    }
  }

    // 이름은 null 이 아니고 3자 이상 이다.
    set name(String value) {
      if (value.length < 3) {
        throw Exception('마법사 이름이 너무 짧습니다.');
      }
      _name = value;
    }
    String get name => _name;

    set mp(int value) {
      if (value < 0) {
        throw Exception('마법사의 마력은 0 이상이어야 합니다.');
      }
      _mp = value;
    }

    int get mp => _mp;

    set hp(int value) {
      if (value < 0) {
        _hp = 0;
        return;
      } else {
        _hp = value;
      }
    }

    int get hp => _hp;

    set wand(Wand? value) {
      if (value == null) {
        throw Exception("지팡이는 null 일수 없습니다.");
      }
      _wand = value;
    }
    Wand? get wand => _wand;

    void heal(Hero hero) {
     if( mp >= 10) {
       mp -= 10;
       hero.hp += 20;
       print('힐을 시전했습니다. 대상 HP: ${hero.hp} 남은 MP: $mp');
     } else {
       print('마나가 부족합니다.');
     }
    }

  }


void main() {
  Wand wand1 = Wand('FairyWand', 50.0);
  Wizard wizard = Wizard('Harry', -199, 50, wand : wand1 );
  print( '${wizard.name} 의 hp : ${wizard.hp}, mp : ${wizard.mp}, Wand : ${wizard.wand?.name }');


  Wizard wizard2 = Wizard('Roan', 0, 50);
  print( '${wizard2.name} 의 hp : ${wizard2.hp}, mp : ${wizard2.mp}, Wand : ${wizard2.wand?.name }');

  Hero hero = Hero('용사', 100);
  Wizard wizard3 =Wizard('마법사', 100, 100);
  wizard3.heal(hero);
}




//if (wand != null) {
//this.wand = wand;
//}
//else {
//throw Exception('지팡이가 필요합니다.');
//};