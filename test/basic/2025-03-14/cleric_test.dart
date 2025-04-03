import 'package:test/test.dart';

import '../../../lib/assignments/basic/2025-03-14/cleric.dart';

main(){
  test("cleric 생성자 test", (){
    // given & when
    Cleric cleric1 = Cleric("아서스", hp: 35, mp: 5);
    Cleric cleric2 = Cleric("아서스", hp: 35);
    Cleric cleric3 = Cleric("아서스");
    // Error
    // Cleric cleric4 = Cleric();
    
    // then
    expect(cleric1.mp, 5);
    expect(cleric2.mp, Cleric.maxMp);
    expect(cleric3.hp, Cleric.maxHp);
    expect(cleric3.mp, Cleric.maxMp);
  });
}