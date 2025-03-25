import 'dart:math';

import 'package:modu_3_dart_study/PR2025-03-24/strongBox2.dart';
import 'package:test/test.dart';

void main() {
  group('strongbox text', () {
    //strongbox에 보관할 물건 선언
    final String thing = '금괴';
    test('padlock으로 생성시 StrongBox클래스로 생성되었는지 확인 Test', () {
      final padlock = StrongBox(keyType: KeyType.padlock);
      padlock.put(thing);
      expect(padlock, isA<StrongBox>());
    });
    test('padlock으로 생성시 maxCount값 확인 Test', () {
      final padlock = StrongBox(keyType: KeyType.padlock);
      padlock.put(thing);
      expect(KeyType.padlock.maxCounts, equals(1024));
    });
    test('maxCount달성시 메세지 출력 확인 Test', () {
      final padlock = StrongBox(keyType: KeyType.padlock);
      padlock.put(thing);
      String? result;
      //maxCount가 달성되면 금고가 열리고 메세지 출력

      for (int i = 0; i <= KeyType.padlock.maxCounts; i++) {
        result = padlock.get();
        if (result != null) {
          print(" 금고가 열렸습니다 : $result (시도 횟수: $i)");
        }
      }
      expect(result, isNotNull);
    });
    test('maxCount달성 실패시 null 출력 확인 Test', () {
      final padlock = StrongBox(keyType: KeyType.padlock);
      padlock.put(thing);
      String? result;
      //maxCount가 달성되면 금고가 열리고 메세지 출력

      for (int i = 0; i <= KeyType.padlock.maxCounts - 1; i++) {
        result = padlock.get();
        if (result != null) {
          print(" 금고가 열렸습니다 : $result (시도 횟수: $i)");
        }
      }
      expect(result, isNull);
    });
  });
}
