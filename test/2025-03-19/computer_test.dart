import 'package:modu_3_dart_study/2025-03-19/computer.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final String name = '윤석';
  final int price = 100;
  final String markerName = '1234567890';
  final String color = '검정';
  final double weight = 100.0;
  final double testWeight = 500.0;

  group("Computer", () {
    test("Computer 생성", (){
      Computer book = Computer(name: name, price: price, color: color, markerName: markerName, weight: weight);

      expect(book, isA<Computer>());
      expect(book.name, equals(name));
      expect(book.price, equals(price));
      expect(book.color, equals(color));
      expect(book.weight, equals(weight));
    });

    test("Computer 무게", (){
      Computer computer = Computer(name: name, price: price, color: color, markerName: markerName, weight: weight);

      //setter
      computer.weight = testWeight;

      expect(computer, isA<Computer>());
      expect(computer.name, equals(name));
      expect(computer.price, equals(price));
      expect(computer.color, equals(color));
      expect(computer.weight, equals(testWeight));
    });

  });
}