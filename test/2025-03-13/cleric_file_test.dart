import 'package:modu_3_dart_study/2025-03-13/cleric_file.dart';
import 'package:test/test.dart';

void main(){

  test("Cleric Given Test", () {

    //준비,실행
    final cleric = Cleric("홍길동");

    //검증
    expect(cleric, equals(isNotNull));
    expect(cleric.name, equals("홍길동"));
    expect(cleric.hp, equals(50));
    expect(cleric.mp, equals(10));
    expect(cleric.maxHp, equals(50));
    expect(cleric.maxMp, equals(10));
  });
  
  test("selfAid Test", (){
    //준비
    final cleric = Cleric("홍길동");

    cleric.hp = 15;

    //실행
    cleric.selfAid();

    expect(cleric.hp, equals(cleric.maxHp));
    expect(cleric.mp, equals(5));

  });


  test('MP 회복 테스트 - 정상적인 회복', () {
    Cleric cleric = Cleric('TestCleric');
    cleric.mp = 5;
    int recoveredMp = cleric.pray(3);
    expect(cleric.mp, lessThanOrEqualTo(cleric.maxMp));
    expect(recoveredMp, inInclusiveRange(3, 5));
  });

  test('MP 회복 테스트 - MP가 이미 최대일 경우', () {
    Cleric cleric = Cleric('TestCleric');
    cleric.mp = 10;
    int recoveredMp = cleric.pray(3);
    expect(recoveredMp, equals(0));
    expect(cleric.mp, equals(10));
  });

  test('MP 회복 테스트 - 회복량이 최대 MP를 초과할 경우', () {
    Cleric cleric = Cleric('TestCleric');
    cleric.mp = 9;
    int recoveredMp = cleric.pray(3);
    expect(recoveredMp, equals(1));
    expect(cleric.mp, equals(10));
  });
}