import '../../assignments/2025-03-17/task_exception.dart';
import '../../assignments/2025-03-17/wizard.dart';
import '../../assignments/2025-03-17/wand.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard 테스트', () {
    test('이름은 3자 이상 되어야 한다.', () {
      const name = 'Han';

      final han = Wizard(name, 0);
      expect(han.name.length, greaterThanOrEqualTo(3));
    });

    test('유효하지 않은 이름에 대한 메세지가 똑같아야 한다. ', () {
      const name = 'H';

      Wizard wizard;

      expect(() {
        wizard = Wizard(name, 0);
      } , throwsA((e) => e is CustomException && e.message == TaskException.invalidName.message));
    });

    test('HP는 음수가 되는 상황에서는 0으로 되어야 한다.', () {
      final han = Wizard('Han', 100);

      han.hp -= 150;

      expect(han.hp, greaterThanOrEqualTo(0));
    });
  });

  group('Wand 테스트', () {
    test('이름은 3자 이상 되어야 한다.', () {
      const name = 'stick';

      final stick = Wand(name, 50.0);

      expect(stick.name.length, greaterThanOrEqualTo(3));
    });

    test('유효하지 않은 이름에 대한 메세지가 똑같아야 한다. ', () {
      const name = 'H';

      Wand wand;

      expect(() {
        wand = Wand(name, 0.0);
      } , throwsA((e) => e is CustomException && e.message == TaskException.invalidName.message));
    });

    test('지팡이 마력은 경계값(0.5와 100.0)을 포함합니다', () {
      final stick = Wand('Foo', 0.5);
      final stickB = Wand('Bar', 100.0);
      final stickC = Wand('Baz', 50.0);

      expect(stick.power, equals(0.5));
      expect(stickB.power, equals(100.0));
      expect(stickC.power, equals(50.0));
    });



    test('유효하지 않은 마력에 대한 메세지가 똑같아야 한다. ', () {
      const double highPower = 101.1;
      const double lowPower = 0.4;

      Wand wand;

      expect(() {
        wand = Wand('foo', highPower);
      } , throwsA((e) => e is CustomException && e.message == TaskException.invalidPower.message));

      expect(() {
        wand = Wand('foo', lowPower);
      }, throwsA((e) => e is CustomException && e.message == TaskException.invalidPower.message));
    });
  });
}