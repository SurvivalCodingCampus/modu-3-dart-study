import 'package:modu_3_dart_study/2025-03/2025-03-19/intangible_asset.dart'
    show IntangibleAsset;
import 'package:modu_3_dart_study/2025-03/2025-03-19/trademark.dart';
import 'package:test/test.dart';

void main() {
  test('Trademark는 IntangibleAsset의 Sub 클래스여야한다.', () {
    // Given
    final Trademark trademark;

    // When
    trademark = Trademark(name: '상표권', price: 1000, owner: "Jay");

    // Then
    expect(trademark, isA<IntangibleAsset>());
  });
  test('Trademark는 이름과 가격, 상표권자 이름을 가져야한다.', () {
    // Given
    final Trademark trademark;

    // When
    trademark = Trademark(name: '상표권', price: 1000, owner: "Jay");

    // Then
    expect(trademark.name, isNot(null));
    expect(trademark.price, isNot(null));
    expect(trademark.owner, isNot(null));
  });
  test('Trademark의 가격을 음수로 초기화할 경우 0으로 초기화 되어야한다.', () {
    // Given
    final Trademark trademark;

    // When
    trademark = Trademark(name: '상표권', price: -1, owner: "Jay");

    // Then
    expect(trademark.price, equals(0));
  });
}
