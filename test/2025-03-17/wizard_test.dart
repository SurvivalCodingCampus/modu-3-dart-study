import 'package:test/test.dart';
import '../../assignments/2025-03-17/wand.dart';
import '../../assignments/2025-03-17/wizard.dart';

void main() {
  group('wand 과제 테스트', () {
    test('올바른 Wand 객체', () {
      Wand wand = Wand(name: "자작나무", power: 50.0);

      expect(wand.name, equals('자작나무'));
      expect(wand.name.length, greaterThanOrEqualTo(3));
      expect(wand.power, inInclusiveRange(50.0, 100.0));
    });

    test('Wand 이름이 3글자 미만이면 예외발생', () {
      // Wand wand = Wand(name: "물", power: 50.0);

      // expect(wand.getName, equals('물'));
      // expect(wand.getName.length, greaterThanOrEqualTo(3));
      // expect(wand.getPower, inInclusiveRange(50.0, 100.0));
      // expect(() => wand.getName == null, throwsException);
      // expect(() => wand.getName.length < 3, throwsException);
      // expect(() => Wand(name: "물", power: 50.0), throwsA(isA<Exception>()));
      expect(
        () => Wand(name: "물", power: 50.0),
        throwsA(
          predicate((e) => e.toString().contains("[지팡이] 3글자 이상의 이름을 사용해주세요.")),
        ),
      );
    });

    test('Wand 마력이 0.5 미만이면 예외 발생', () {
      // Wand wand = Wand(name: "도토리나무", power: 0.4);

      // expect(wand.getName, equals('도토리나무'));
      // expect(wand.getName.length, greaterThanOrEqualTo(3));
      // expect(wand.getPower, inInclusiveRange(50.0, 100.0));

      expect(
        () => Wand(name: "도토리나무", power: 0.4),
        throwsA(
          predicate(
            (e) =>
                e.toString().contains("[지팡이]의 마력은 0.5 이상 100.0 이하로 설정해 주세요."),
          ),
        ),
      );
    });

    test('Wand 마력이 100.0 초과이면 예외 발생', () {
      // Wand wand = Wand(name: "딱총나무", power: 100.1);

      // expect(wand.getName, equals('딱총나무'));
      // expect(wand.getName.length, greaterThanOrEqualTo(3));
      // expect(wand.getPower, inInclusiveRange(50.0, 100.0));

      expect(
        () => Wand(name: "딱총나무", power: 100.1),
        throwsA(
          predicate(
            (e) =>
                e.toString().contains("[지팡이]의 마력은 0.5 이상 100.0 이하로 설정해 주세요."),
          ),
        ),
      );
    });
  });

  group('Wizard 테스트', () {
    test('올바른 Wizard 객체 생성', () {
      Wizard wizard = Wizard(
        name: '지롱이',
        hp: 40,
        mp: 10,
        wand: Wand(name: '딱총나무', power: 60.6),
      );

      expect(wizard.getName, equals('지롱이'));
      expect(wizard.getName.length, greaterThanOrEqualTo(3));
      expect(wizard.getHp, greaterThanOrEqualTo(0)); // 0보다 큰가?
      expect(wizard.getMp, greaterThanOrEqualTo(0));
    });

    test('Wizard name 3개 미만 예외발생', () {
      Wizard wizard = Wizard(
        name: '지롱',
        hp: 40,
        mp: 10,
        wand: Wand(name: '딱총나무', power: 60.6),
      );

      expect(wizard.getName.length, greaterThanOrEqualTo(3));
      expect(wizard.getHp, greaterThanOrEqualTo(0)); // 0보다 큰가?
      expect(wizard.getMp, greaterThanOrEqualTo(0));
    });

    test('Wizard MP가 0 미만이면 예외발생', () {
      Wizard wizard = Wizard(
        name: '지롱이',
        hp: 100,
        mp: -1,
        wand: Wand(name: '딱총나무', power: 60.6),
      );

      expect(wizard.getName.length, greaterThanOrEqualTo(3));
      expect(wizard.getHp, greaterThanOrEqualTo(0)); // 0보다 큰가?
      expect(wizard.getMp, greaterThanOrEqualTo(0));
    });

    test('Wizard HP가 음수 일때 0으로 자동세팅', () {
      Wizard wizard = Wizard(
        name: '지롱이',
        hp: -1,
        mp: 50,
        wand: Wand(name: '딱총나무', power: 60.6),
      );

      expect(wizard.getName.length, greaterThanOrEqualTo(3));
      expect(wizard.getHp, greaterThanOrEqualTo(0)); // 0보다 큰가?
      expect(wizard.getMp, greaterThanOrEqualTo(0));
    });

    test('Wizard의 wand를 null로 설정하면 예외발생', () {
      Wizard wizard = Wizard(
        name: '지롱이',
        hp: -1,
        mp: 50,
        wand: Wand(name: '딱총나무', power: 60.6),
      );

      wizard.setWand = null;

      expect(() => wizard, returnsNormally);
      expect(wizard.getName.length, greaterThanOrEqualTo(3));
      expect(wizard.getHp, greaterThanOrEqualTo(0)); // 0보다 큰가?
      expect(wizard.getMp, greaterThanOrEqualTo(0));
    });
  });
}
