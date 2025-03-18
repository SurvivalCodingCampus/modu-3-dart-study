import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/2025_03_14/solution1.dart';

void main() {
  test('static 변수 사용', () {
    int staticHp = Cleric.maxHp;
    int staticMp = Cleric.maxMp;

    // 이름만 지정한 인스턴스 생성 hp 와 mp 는 최대 hp, mp 로 초기화
    Cleric asus = Cleric('아서스');

    // 전역변수와 생성한 인스턴스의 hp, mp 가 같은지 체크
    expect(asus.hp, staticHp);
    print('${asus.hp} / $staticHp 는 같다 !');
    expect(asus.mp, staticMp);
    print('${asus.mp} / $staticMp 는 같다 !');
  });

  test('여러 생성자를 이용한 인스턴스화', () {
    Cleric asus = Cleric('아서스1', hp: 40, mp: 5);
    Cleric asus2 = Cleric('아서스2', hp: 45);
    Cleric asus3 = Cleric('아서스3');

    // 내가 지정한 값들로 인스턴스가 잘 생성 됐는지 체크
    expect(asus.name, '아서스1');
    expect(asus.hp, 40);
    expect(asus.mp, 5);
    print('이름 : ${asus.name}, HP : ${asus.hp}, MP : ${asus.mp}');

    // asus1 의 mp 는 최대 mp 인지 체크
    expect(asus2.mp, Cleric.maxMp);
    print('이름 : ${asus2.name}, HP : ${asus2.hp}, MP : ${asus2.mp}');

    // asus2 의 hp, mp 는 최대 hp, mp 인지 체크
    expect(asus3.hp, Cleric.maxHp);
    expect(asus3.mp, Cleric.maxMp);
    print('이름 : ${asus3.name}, HP : ${asus3.hp}, MP : ${asus3.mp}');
  });
}
