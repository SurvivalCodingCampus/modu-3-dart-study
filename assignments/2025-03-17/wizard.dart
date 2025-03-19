import 'package:modu_3_dart_study/PR2025-03-17/wand.dart';
import 'package:test/test.dart';

class Wizard {
  String _name = "";
  int _hp = 0;
  int _mp = 0;
  Wand? _wand;

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  set name(String value) {
    if (value.length < 3) {
      throw Exception("이름이 너무 짧습니다.");
    }
    _name = value;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      throw Exception('hp는 음수가 불가능하여 0으로 설정합니다');
    } else {
      _hp = value;
    }
  }

  set mp(int value) {
    if (value < 0) {
      _mp = 0;
      throw Exception("MP는 음수일 수 없습니다.");
    }
    _mp = value;
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이가 생성된 이후에는 Null로 지정할 수 없습니다');
    }
    _wand = value;
  }
  
  Wizard({required String name, required int hp, required int mp, Wand? wand}) {
    this.name = name;
    this.hp = hp;
    this.mp = mp;
    this.wand = wand;
  }
}

void main() {
  group('Wizard test', () {
    test('마법사 이름 수 test', () {
      //given
      Wand woodWand = Wand(name: "나무지팡이", power: 3);
      Wand waterWand = Wand(name: "물지팡이", power: 10);
      //when
      Wizard wizard = Wizard(name: "마법사", hp: 50, mp: 5, wand: waterWand);
      //then(검증)
      expect(wizard.name.length, greaterThanOrEqualTo(3));
    });
    test('지팡이 이름 수 test', () {
      //given
      Wand woodWand = Wand(name: "나무지팡이", power: 3);
      Wand waterWand = Wand(name: "물지팡이", power: 10);
      //when
      Wizard wizard = Wizard(name: "마법사", hp: 50, mp: 5, wand: waterWand);
      //then(검증)
      expect(waterWand.name.length, greaterThanOrEqualTo(3));
    });
    test('HP수 test', () {
      //given
      Wand woodWand = Wand(name: "나무지팡이", power: 3);
      Wand waterWand = Wand(name: "물지팡이", power: 10);
      //when
      Wizard wizard = Wizard(name: "마법사", hp: 50, mp: 5, wand: waterWand);
      //then(검증)
      expect(wizard.hp, greaterThanOrEqualTo(0));
    });
    test('MP수 test', () {
      //given
      Wand woodWand = Wand(name: "나무지팡이", power: 3);
      Wand waterWand = Wand(name: "물지팡이", power: 10);
      //when
      Wizard wizard = Wizard(name: "마법사", hp: 50, mp: 5, wand: waterWand);
      //then(검증)
      expect(wizard.mp, greaterThanOrEqualTo(0));
    });
  });
}
