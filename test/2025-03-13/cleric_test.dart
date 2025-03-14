import 'package:modu_3_dart_study/2025-03-13/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('selfAid 테스트', () {
    // 준비
    Cleric cleric = Cleric('성직자', 30, 10);
    //실행
    cleric.selfAid();
    //검증
    expect(cleric.hp, equals(50)); // HP가 전부 회복되었는지 확인
    expect(cleric.mp, lessThan(10)); // MP가 감소하였는지 확인
  });

  test('pray 테스트', () {
    // 준비
    Cleric cleric = Cleric('성직자', 50, 5);
    //실행
    int prayMP = cleric.pray(9); //기도 시간 지정
    //검증
    expect(prayMP, lessThanOrEqualTo(9 + 2)); // 기도한 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한 양인지 확인
    expect(cleric.mp, greaterThan(5));  // 초기 MP 값보다 증가했는지 확인
    expect(cleric.mp, lessThanOrEqualTo(10)); // maxMP를 넘지 않았는지 확인
  });
}