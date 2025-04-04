import 'package:modu_3_dart_study/assignments/2025-03-19/src/solution/asset.dart';
import 'package:modu_3_dart_study/assignments/2025-03-19/src/solution/computer.dart';
import 'package:modu_3_dart_study/assignments/2025-03-19/src/solution/tangible_asset.dart';
import 'package:test/test.dart';

void main() {
  String makerName = '애플';
  String name = '아이맥';
  int price = 3000000;
  String color = '스페이스 블랙';
  double weight = 500.0;

  // given
  Computer computer = Computer(
    makerName: makerName,
    name: name,
    price: price,
    color: color,
    weight: weight,
  );

  test('Computer 생성 성공', () {
    // then
    expect(computer, isA<Computer>());
    expect(computer, isA<TangibleAsset>());
    expect(computer, isA<Asset>());
    expect(computer.makerName, equals(makerName));
    expect(computer.name, equals(name));
    expect(computer.price, equals(price));
    expect(computer.color, equals(color));
    expect(computer.weight, equals(weight));
  });

  test('Thing 인터페이스 getter & setter 확인', () {
    expect(computer.weight, equals(weight));
    computer.weight = weight + 500;
    expect(computer.weight, equals(weight + 500));
  });
}
