import 'package:modu_3_dart_study/2025-03-14/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('아서스, hp: 40, mp: 5 인스턴스 생성 테스트', () {
    // 준비
    final Cleric cleric1 = Cleric('아서스', hp: 40, mp: 5);

    //검증
    expect(cleric1, isA<Cleric>());
    expect(cleric1.hp, equals(40)); // HP가 그대로인지 확인
    expect(cleric1.mp, equals(5)); // MP가 그대로인지 확인
    expect(cleric1.name, equals('아서스')); // 이름 확인
  });
  test('아서스, hp: 35 인스턴스 생성 테스트', () {
    // 준비
    final Cleric cleric2 = Cleric('아서스', hp: 35);

    //검증
    expect(cleric2, isA<Cleric>());
    expect(cleric2.hp, equals(35)); // HP가 그대로인지 확인
    expect(cleric2.mp, equals(Cleric.maxMP)); // MP가 최대치인지 확인
    expect(cleric2.name, equals('아서스')); // 이름 확인
  });
  test('아서스 인스턴스 생성 테스트', () {
    // 준비
    final Cleric cleric3 = Cleric('아서스');

    //검증
    expect(cleric3, isA<Cleric>());
    expect(cleric3.hp, equals(Cleric.maxHP)); // HP가 최대치인지 확인
    expect(cleric3.mp, equals(Cleric.maxMP)); // MP가 최대치인지 확인
    expect(cleric3.name, equals('아서스')); // 이름 확인
  });

  test('selfAid 회복 성공 테스트', () {
    // 준비
    const testHP = 30;
    const testMP = 6;
    Cleric cleric = Cleric('성직자', hp: testHP, mp: testMP);
    //실행
    cleric.selfAid();
    //검증
    expect(cleric.hp, equals(50)); // HP가 전부 회복되었는지 확인
    expect(cleric.mp, equals(testMP - 5)); // MP가 감소하였는지 확인
  });
  test('selfAid 회복 실패 테스트', () {
    // 준비
    const testHP = 30;
    const testMP = 4;
    Cleric cleric = Cleric('성직자', hp: testHP, mp: testMP);
    //실행
    cleric.selfAid();
    //검증
    expect(cleric.hp, equals(testHP)); // HP가 그대로인지 확인
    expect(cleric.mp, equals(testMP)); // MP가 그대로인지 확인
  });

  test('pray 테스트', () {
    // 준비
    const testHP = 50;
    const testMP = 4;
    const sec = 9;
    Cleric cleric = Cleric('성직자', hp: testHP, mp: testMP);
    //실행
    int prayMP = cleric.pray(sec); //기도 시간 지정
    //검증
    expect(prayMP, lessThanOrEqualTo(sec + 2),); // 기도한 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한 양인지 확인
    expect(cleric.mp, greaterThan(testMP)); // 초기 MP 값보다 증가했는지 확인
    expect(cleric.mp, lessThanOrEqualTo(10)); // maxMP를 넘지 않았는지 확인
  });
}
