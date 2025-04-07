import 'package:test/test.dart';

import 'package:modu_3_dart_study/assignments/2025-03-20/a.dart';
import 'package:modu_3_dart_study/assignments/2025-03-20/b.dart';
import 'package:modu_3_dart_study/assignments/2025-03-20/x.dart';
import 'package:modu_3_dart_study/assignments/2025-03-20/y.dart';

void main() {
  group('Solution2', () {
    test('obj 호출 가능 함수', () {
      X obj = A();

      // obj.b(); // ❌ 불가능 -> X 인터페이스에 b() 메서드가 없기 때문에 컴파일 오류가 발생
      // obj.c(); // ❌ 불가능 -> X 인터페이스에 c() 메서드가 없기 때문에 컴파일 오류가 발생

      expect(() => obj.a(), prints('Aa\n'));
      // Aa 출력 -> A에서 오버라이드한 a() 메서드를 호출하기 때문에 Aa가 출력
    });

    test('출력 내용', () {
      Y y1 = A();
      Y y2 = B();

      expect(() => y1.a(), prints('Aa\n'));
      expect(() => y1.b(), prints('Ab\n'));
      expect(() => y2.a(), prints('Ba\n'));
      expect(() => y2.b(), prints('Bb\n'));

      // y1.c()  // ❌ 불가능
      // y2.c()  // ❌ 불가능
    });
  });

  group('Solution3', () {
    test('List에 담은 Y타입 인스턴스의 b() 호출', () {
      List<Y> list = [];
      list.add(A());
      list.add(B());

      expect(() => list[0].b(), prints('Ab\n'));
      expect(() => list[1].b(), prints('Bb\n'));
    });
  });
}
