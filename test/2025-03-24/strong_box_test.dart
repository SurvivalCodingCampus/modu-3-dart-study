import 'package:modu_3_dart_study/2025-03-24/index.dart';
import 'package:test/test.dart';

void main() {
  group('Strong Box 테스트', () {
    test('StrongBox type이 정상적으로 생성되어야 한다.', () {
      const type = KeyType.padlock;

      final box = StrongBox(type: type, data: 'foo');

      expect(type, box.type);
    });

    test('StrongBox을 열 때 타입 별 리밋 이후에 열려야 한다.', () {
      const type = KeyType.padlock;
      const data = 'Hello World!';
      final limit = type.openCountLimit;

      final box = StrongBox(type: type, data: data);

      for (int i = 0; i < limit; i++) {
        expect(box.get(), isNull);
      }

      expect(box.get(), equals(data));
    });
  });
}
