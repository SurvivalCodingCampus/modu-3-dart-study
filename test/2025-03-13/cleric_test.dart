import 'package:modu_3_dart_study/2025-03-13/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('selfAid 테스트', () {
    // 준비
    Cleric cleric = Cleric('이름', 50, 10);
    //실행
    cleric.selfAid();
    //검증
    expect(cleric.HP, equals(50));
    expect(cleric.MP, lessThan(10));
  });
}