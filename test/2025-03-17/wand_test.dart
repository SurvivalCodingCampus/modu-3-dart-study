
import 'package:test/test.dart';
import '../../assignments/2025-03-17/wand.dart';

void main() {
  test('Wand Test', () {

    final Wand wand;

    wand = Wand(name: 'wandA', power: 100);

    expect(wand.name, equals('wandA'));
    expect(wand.power, equals(100));
  });
  test('Wand Test2', () {

    final Wand wand;

    wand = Wand(name: 'wandA', power: 99.9);

    try {
      wand.name = 'wD';
    } catch (e) {
      print('$e');
    }

    expect(() => wand.name = 'wA', throwsA(isA<Exception>()));

    try {
      wand.power = 0.2;
    } catch (e) {
      print('$e');
    }

    expect(() => wand.power = 0.33, throwsA(isA<Exception>()));
  });

  test('Wizard test - wand', () {
    final Wizard wizard;

    wizard = Wizard(name: 'wzdQ', wand: Wand(name: 'wand', power: 55));

    try {
      wizard.wand = null;
    } catch (e) {
      print('$e');
    }

    expect(() => wizard.wand = null, throwsA(isA<Exception>()));

  });

  test('Wizard test - hp', () {
    final Wizard wizard;

    wizard = Wizard(name: 'wzdQ', hp: -5, wand: Wand(name: 'ddd', power: 5));


    expect(wizard.hp, equals(0));

  });

}