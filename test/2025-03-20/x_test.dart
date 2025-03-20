import 'package:modu_3_dart_study/2025-03-20/a.dart';
import 'package:modu_3_dart_study/2025-03-20/b.dart';
import 'package:modu_3_dart_study/2025-03-20/y.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  test('테스트', () {
    List<Y> y = [
      A(),
      B()
    ];
    
    for (final y in y) {
      y.b();
    }
  });
}
