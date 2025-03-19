import 'package:modu_3_dart_study/2025-03-19/Thing.dart';
import 'package:modu_3_dart_study/2025-03-19/assets.dart';
import 'package:modu_3_dart_study/2025-03-19/object.dart';
import 'package:test/test.dart';


void main() {
  const String bookName = '룬의 아이들';
  const int bookPrice = 15000;
  const String bookPatent = '전민희';
  const String bookColor = '검정';
  const String bookISBN = '987-654-321';
  const double bookWeight = 400.0;

  const String computerName = '맥북 프로';
  const int computerPrice = 2500000;
  const String computerPatent = '애플';
  const String computerColor = '은색';
  const String computerMaker = '애플';
  const double computerWeight = 1370.0;

  const String softwareName = '윈도우 11 OS';
  const int softwarePrice = 139000;
  const String softwarePatent = '마이크로소프트';
  const String softwarePlatform = '데스크탑';
  const String softwareStore = '마이크로소프트 스토어';

  group('TangibleAsset 테스트', () {
    test('Book이 TangibleAsset을 상속받고, 모든 속성이 올바르게 초기화되어야 한다', () {
      var book = Book(
        name: bookName,
        price: bookPrice,
        patent: bookPatent,
        color: bookColor,
        isbn: bookISBN,
        weight: bookWeight,
      );

      expect(book, isA<TangibleAsset>());
      expect(book.name, equals(bookName));
      expect(book.price, equals(bookPrice));
      expect(book.patent, equals(bookPatent));
      expect(book.color, equals(bookColor));
      expect(book.isbn, equals(bookISBN));
      expect(book.weight, equals(bookWeight));
    });

    test('Computer가 TangibleAsset을 상속받고, 모든 속성이 올바르게 초기화되어야 한다', () {
      var computer = Computer(
        name: computerName,
        price: computerPrice,
        patent: computerPatent,
        color: computerColor,
        makerName: computerMaker,
        weight: computerWeight,
      );

      expect(computer, isA<TangibleAsset>());
      expect(computer.name, equals(computerName));
      expect(computer.price, equals(computerPrice));
      expect(computer.patent, equals(computerPatent));
      expect(computer.color, equals(computerColor));
      expect(computer.makerName, equals(computerMaker));
      expect(computer.weight, equals(computerWeight));
    });
  });

  group('IntangibleAsset 테스트', () {
    test('Software가 IntangibleAsset을 상속받고, 모든 속성이 올바르게 초기화되어야 한다', () {
      var software = Software(
        name: softwareName,
        price: softwarePrice,
        patent: softwarePatent,
        platform: softwarePlatform,
        store: softwareStore,
      );

      expect(software, isA<IntangibleAsset>());
      expect(software.name, equals(softwareName));
      expect(software.price, equals(softwarePrice));
      expect(software.patent, equals(softwarePatent));
      expect(software.platform, equals(softwarePlatform));
      expect(software.store, equals(softwareStore));
    });
  });

  group('Thing 인터페이스 테스트', () {
    test('Book이 Thing 인터페이스를 구현해야 한다', () {
      var book = Book(
        name: bookName,
        price: bookPrice,
        patent: bookPatent,
        color: bookColor,
        isbn: bookISBN,
        weight: bookWeight,
      );

      expect(book, isA<Thing>());
      expect(book.weight, equals(bookWeight));
    });

    test('Computer가 Thing 인터페이스를 구현해야 한다', () {
      var computer = Computer(
        name: computerName,
        price: computerPrice,
        patent: computerPatent,
        color: computerColor,
        makerName: computerMaker,
        weight: computerWeight,
      );

      expect(computer, isA<Thing>());
      expect(computer.weight, equals(computerWeight));
    });

    test('Thing 인터페이스의 weight getter/setter가 정상 동작해야 한다', () {
      const double updatedWeight = 500.0;

      var book = Book(
        name: bookName,
        price: bookPrice,
        patent: bookPatent,
        color: bookColor,
        isbn: bookISBN,
        weight: bookWeight,
      );

      book.weight = updatedWeight;
      expect(book.weight, equals(updatedWeight));
    });
  });
}