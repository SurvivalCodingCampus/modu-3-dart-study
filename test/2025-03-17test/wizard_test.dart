import 'package:modu_3_dart_study/PR2025-03-17/wand.dart';
import 'package:modu_3_dart_study/PR2025-03-17/wizard.dart';
import 'package:test/test.dart';

void main() {
  //test할때 0<= x <=100 이라면 0, 100 해보고 101과 -1도 해보며 성공 보기
  group('Wizard test', () {
    test('마법사 이름 수 test', () {
      //given
      // ignore: unused_local_variable
      Wand woodWand = Wand(name: "나무지팡이", power: 3);
      Wand waterWand = Wand(name: "물지팡이", power: 10);
      //when
      Wizard wizard = Wizard(name: "마법사", hp: 50, mp: 0, wand: waterWand);
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
      Wizard wizard = Wizard(name: "마법사", hp: 50, mp: 1, wand: waterWand);
      //then(검증)
      expect(wizard.mp, greaterThanOrEqualTo(0));
    });
    // test('이름이 null일때 test', () {
    //   //given
    //   Wand woodWand = Wand(name: "나무지팡이", power: 3);
    //   Wand waterWand = Wand(name: "물지팡이", power: 10);
    //   //when
    //   Wizard wizard = Wizard(name: "마법사", hp: 50, mp: 5, wand: waterWand);
    //   //then(검증)
    //   expect(() => wizard.name == "", throwsException);
    // });
  });
}
