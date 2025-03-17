import 'package:modu_3_dart_study/2025-03-17/person.dart';
import 'package:modu_3_dart_study/2025-03-17/wand.dart';
import 'package:modu_3_dart_study/2025-03-17/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard Test', () {
    // wand 테스트 객체
    Wand wand = Wand(name: 'GreatWand', power: 60.0);

    test("1. Wizard 객체 생성시 기본값 설정 확인 ", () {
      Wizard wizard = Wizard(name: 'bigWizard', hp: 100, wand: wand, mp: 50);
      //각 변수값 확인
      expect(wizard.name, 'bigWizard');
      expect(wizard.hp, 100);
      expect(wizard.mp, 50);
      expect(wizard.wand, wand);
    });

    test ("2. 이름은 3자 이상이어야 한다.", () {
      Wizard wizard = Wizard(name: 'bigWizard', hp: 100, wand: wand, mp: 50);

      // 이름 체크
      expect(() => wizard.name = 'bi', throwsException);
      expect(() => wizard.name = 'big', returnsNormally);
    });

    test ("3. Hp는 음수값을 설정할 수 없습니다.", () {
      Wizard wizard = Wizard(name: 'bigWizard', hp: 100, wand: wand, mp: 50);

      // 이름 체크
      expect(() => wizard.hp = -10, throwsException);
      expect(wizard.hp, 0);
    });

    test ("4. Mp는 음수값을 설정할 수 없습니다.", () {
      Wizard wizard = Wizard(name: 'bigWizard', hp: 100, wand: wand, mp: 50);

      // 이름 체크
      expect(() => wizard.mp = -10, throwsException);
      expect(wizard.mp, 0);
    });

    test ("5. 지팡이는 null로 설정할 수 없습니다.", () {
      Wizard wizard = Wizard(name: 'bigWizard', hp: 100, wand: wand, mp: 50);

      // 이름 체크
      expect(() => wizard.wand = null, throwsException);

    });

  });


  group('Wand Test', () {
    test("1. 이름은 3자 이상이어야 한다. ", () {
      // given(준비)
      // when(실행)
      // then(검증)
      expect(() => Wand(name: 'it', power: 30), throwsException);
      expect(() => Wand(name: 'Good', power: 30), returnsNormally);

    });

    test("2. 마력 값이 올바른 범위에 있어야 합니다.", () {
      // given(준비)
      // when(실행)
      // then(검증)
      // 잘못된 값 예외 발생
      expect(() => Wand(name: 'test', power: 0.4), throwsException);
      expect(() => Wand(name: 'test', power: 100.0), throwsException);
      // 정상적인 값
      expect(() => Wand(name: 'test', power: 0.5), returnsNormally);

    });

    test("3.power setter가 범위 값을 허용하고, 아니면 예외를 발생시켜야 한다. ", () {
      // given(준비)
      Wand wand = Wand(name: 'GreatWand', power: 1.0);
      // when(실행)
      // then(검증)
      //잘못된 값 예외 발생
      expect(() => wand.power = 0.3, throwsException);
      expect(() => wand.power = 100.1, throwsException);
      //정상적인 값
      expect(() => wand.power = 60.0, returnsNormally);
    });

    test("4. name setter가 올바른 값을 허용하고 아니면 예외를 발생시켜야 한다.", () {
      // given(준비)
      Wand wand = Wand(name: 'GreatWand', power: 1.0);
      // when(실행)
      // then(검증)
      //잘못된 값 예외 발생
      expect(() => wand.name = 'it', throwsException);
      //정상적인 값
      expect(() => wand.name = 'GreatWand', returnsNormally);
    });


  });

  group('Person Test', () {
    const String name = '문성용';
    const int birthYear = 1975;

    test("1. 이름과 태어난 해를 생성자로 받아 정상적인 인스턴스를 생성해야한다.", () {
      // given(준비)

      // when(실행)
      Person person = Person(name: name, birthYear: birthYear);

      // then(검증)
      expect(person.name, equals('문성용'));
      expect(person.birthYear, equals(1975));
    });

    test("2. 이름과 태어난 해는 한번 정해지면 수정이 불가능하다.", () {
      // given(준비)

      // when(실행)
      Person person = Person(name: name, birthYear: birthYear);
      //person.name = '홍길동';   //Error: There isn't a setter named 'name' in class 'Person'.
      //person.birthYear = 2000;   //Error; There isn't a setter named 'birthYear' in class 'Person'.

      // then(검증)
      expect(person.name, equals('문성용'));
      expect(person.birthYear, equals(1975));
    });

    test("3. age 프로퍼티는 임의로 수정할 수 없다.", () {
      // given(준비)

      // when(실행)
      Person person = Person(name: name, birthYear: birthYear);
      // then(검증)
      // age는 getter로만 읽을 수 있고 수정할 수 없으므로, setter가 없으면 수정 불가능
      // person.age = 25;  // Error: There isn't a setter named 'age' in class 'Person'.
      //expect(() => person.age = 25, throwsNoSuchMethodError);  //Method가 존재하지 않을때.
      //expect(() => person.age = 25, throwsA(isA<TypeError>()));
    });

    test("4. 나이 계산은 올해년도에서 birthYear 년도를 뺀 값을 리턴해야한다.", () {
      // given(준비)

      // when(실행)
      Person person = Person(name: name, birthYear: birthYear);

      // then(검증)
      expect(person.age, equals(50));
    });
  });


}
