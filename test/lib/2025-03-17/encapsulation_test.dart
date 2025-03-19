import 'package:modu_3_dart_study/2025-03-17/encapsulation/person.dart';
import 'package:modu_3_dart_study/2025-03-17/encapsulation/wand.dart';
import 'package:modu_3_dart_study/2025-03-17/encapsulation/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('[Wizard]', () {
    test('마법사의 이름이 3글자 미만이면 예외가 발생해야 한다.', () {
      expect(
        () => Wizard(name: 'AB', hp: 10, mp: 10),
        throwsA(isA<Exception>()),
      );
    });
    test('마법사의 이름이 3글자 이상이면 정상적으로 생성되야한다. ', () {
      // Given
      final Wizard wizard;

      // When
      wizard = Wizard(name: "ABC", hp: 10, mp: 10);

      // Then
      expect(wizard, isA<Wizard>());
    });
  });

  group('[Wand]', () {
    test('지팡이의 이름이 3글자 미만이면 예외가 발생해야 한다.', () {
      expect(() => Wand(name: 'AB', power: 0.5), throwsA(isA<Exception>()));
    });

    test('지팡이의 이름이 3글자 이상이면 정상적으로 생성되야한다.', () {
      // Given
      final Wand wand;

      // When
      wand = Wand(name: "ABC", power: 0.5);

      // Then
      expect(wand, isA<Wand>());
    });
    test('지팡이 생성 시 마력은 0.5 이상 100.0 이하여야 한다.', () {
      // Given
      final Wand min;
      final Wand max;

      // When
      min = Wand(name: "MIN", power: 0.5);
      max = Wand(name: "MAX", power: 100.0);

      // Then
      expect(min.power, inInclusiveRange(Wand.minPower, Wand.maxPower));
      expect(max.power, inInclusiveRange(Wand.minPower, Wand.maxPower));
    });
    test('지팡이 생성 시 마력이 0.5 미만인 경우 예외가 발생해야한다.', () {
      expect(() => Wand(name: 'LESS', power: 0.4), throwsA(isA<Exception>()));
    });
    test('지팡이 생성 시 마력이 100.0 초과인 경우 예외가 발생해야한다.', () {
      expect(() => Wand(name: 'OVER', power: 100.1), throwsA(isA<Exception>()));
    });
  });

  group('[Person]', () {
    test('age 프로퍼티를 통해 올해 - 생년 을 뺀 값을 반환해야한다.', () {
      // Given
      final DateTime dateTime = DateTime.parse('1995-09-12');
      final Person person = Person(name: 'Person', birthYear: dateTime);

      // When
      int age = person.age;

      // Then
      expect(age, equals(30));
    });
  });
}
