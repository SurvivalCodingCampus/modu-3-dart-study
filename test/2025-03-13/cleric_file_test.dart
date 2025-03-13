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


  test("pray test", (){
    //준비
    final cleric = Cleric("홍길동",prayTime: 3);

    cleric.mp = 9;
    cleric.pray(3);

  });
}