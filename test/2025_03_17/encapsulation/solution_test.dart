import 'package:test/test.dart';
import '../../../assignments/2025_03_17/encapsulation/solution1.dart';
import '../../../assignments/2025_03_17/encapsulation/solution2.dart';

void main() {
  test('Wizard 의 타당성 검사 (Setter) ', () {
    Wand wand = Wand(name: '완드', power: 50);
    Wizard wizard = Wizard(name: '유준', hp: 30, mp: 20, wand: wand);

    // 이름이 빈 값일 때
    expect(() => wizard.name = '', throwsException);
    // 이름이 3글자 보다 작을 경우
    expect(() => wizard.name = '유', throwsException);
    // hp는 0보다 작아질 수 없음 0으로 변환
    wizard.hp -= 50;
    expect(wizard.hp, 0);
    //mp 는 0 보다 작아 질 수 없음.
    expect(() => wizard.mp = -5, throwsException);

    expect(() => wizard.wand = null, throwsException);
  });

  test('Wand 의 타당성 검사 (Setter) ', () {
    Wand wand = Wand(name: '완드', power: 30);

    // 이름이 빈 값일 때
    expect(() => wand.name = '', throwsException);
    // 이름이 3글자 보다 작을 경우
    expect(() => wand.name = '유', throwsException);

    // 마력이 0.5 보다 작을 경우
    expect(() => wand.power = 0, throwsException);
    // 마력이 100이 넘을 경우
    expect(() => wand.power = 110, throwsException);
  });

  test('Person class 의 age 출력 ', () {
    PersonCapsul person = PersonCapsul(name: '유준', birthYear: 1997);

    expect(person.age, DateTime.now().year - person.birthYear);
    print('나이는 ${person.age}');
  });
}
