import 'package:modu_3_dart_study/2025-03-19/asset_management/Book.dart';
import 'package:modu_3_dart_study/2025-03-19/asset_management/Computer.dart';
import 'package:modu_3_dart_study/2025-03-19/asset_management/Patent.dart';
import 'package:modu_3_dart_study/2025-03-19/asset_management/asset.dart';
import 'package:modu_3_dart_study/2025-03-19/asset_management/intangible_asset.dart';
import 'package:modu_3_dart_study/2025-03-19/asset_management/tangible_asset.dart';
import 'package:modu_3_dart_study/2025-03-19/asset_management/thing.dart';

import 'package:test/test.dart';

void main() {

  //Asset 상속 받은 book, computer, patent 객체 생성자 테스트
  group('[Asset 클래스 테스트] -', () {
    test('Book 객체 생성 및 필드값 확인', () {
      Book book = Book(
        name: '오준석의 플러터 생존코딩',
        price: 28000,
        color: 'white',
        weight: 2.0,
        isbn: '979-11-6224-437-1',
      );

      expect(book.name, equals('오준석의 플러터 생존코딩'));
      expect(book.price, equals(28000));
      expect(book.color, equals('white'));
      expect(book.weight, equals(2.0));
      expect(book.isbn, equals('979-11-6224-437-1')); //isbn 현재 13자리 표준.
    });

    test('Computer 객체 생성 및 필드값 확인', () {
      Computer computer = Computer(
        name: 'MacBook Pro',
        price: 2500000,
        color: 'Silver',
        weight: 1.4,
        makerName: 'Apple',
      );

      expect(computer.name, equals('MacBook Pro'));
      expect(computer.price, equals(2500000));
      expect(computer.color, equals('Silver'));
      expect(computer.weight, equals(1.4));
      expect(computer.makerName, equals('Apple'));
    });

    test('Patent 객체 생성 및 필드값 확인', () {
      Patent patent = Patent(
        name: 'AI agent control',
        price: 5000000,
        owner: 'Soridream',
        exclusiveRight: true,
        patentDurationYears: 20,
      );

      expect(patent.name, equals('AI agent control'));
      expect(patent.price, equals(5000000));
      expect(patent.owner, equals('Soridream'));
      expect(patent.exclusiveRight, isTrue);
      expect(patent.patentDurationYears, equals(20));
    });
  });

  group('[Thing 인터페이스 구현 및 weight 테스트] -', () {
    test('weight 값 설정하고  가져오기', () {
      Book book = Book(
        name: '영어는 덤이다',
        price: 15800,
        color: 'Red',
        weight: 1.5,
        isbn: '978-3-598-21508-0',
      );

      book.weight = 2.0;
      expect(book.weight, equals(2.0));
    });

    test('weight에 음수 값을 설정하면 예외 발생확인', () {
      Computer computer = Computer(
        name: 'Dell XPS',
        price: 1500000,
        color: 'Black',
        weight: 2.5,
        makerName: 'Dell',
      );

      //인터페이스 weight 값에 음수 셋팅.
      //람다함수로 즉시 실행되지 않고, 실행할 수 있는 함수 객체로 유지됨.
      //테스트 코드를 람다함수로 감싸서 expect가 실행할 수 있도록 해서 테스트 중단 방지.
      expect(() => computer.weight = -1.0, throwsArgumentError);
    });
  });

  //같은 타입의 변수(asset)로 asset을 상속 받은 다양한 객체를 핸들링할 수 있는 다형성 테스트.
  //추후 @override, 인터페이스, 타입캐스팅으로 확장 테스트
  group('[다형성 테스트] -', () {
    test('TangibleAsset이 Asset 타입으로 동작하는지 확인', () {
      Asset asset = Book(
        name: '세이노의 가르침',
        price: 25000,
        color: 'Yellow',
        weight: 1.0,
        isbn: '978-0-19-853453-3',
      );

      expect(asset.name, equals('세이노의 가르침'));
      expect(asset.price, equals(25000));

      //is 연산자를 활용해서 객체가 상속과 관련된 모든 객체타입인지 체크
      expect(asset is Asset, isTrue);
      expect(asset is TangibleAsset, isTrue);
      expect(asset is Book, isTrue);
    });

    test('IntangibleAsset이 Asset 타입으로 동작하는지 확인', () {
      Asset asset = Patent(
        name: '점진적 습관 교정',
        price: 10000000,
        owner: '문성용',
        exclusiveRight: true,
        patentDurationYears: 15,
      );

      expect(asset.name, equals('점진적 습관 교정'));
      expect(asset.price, equals(10000000));
      expect(asset is Asset, isTrue);
      expect(asset is IntangibleAsset, isTrue);
      expect(asset is Patent, isTrue);
    });
  });
}
