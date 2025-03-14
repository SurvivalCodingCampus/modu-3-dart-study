

import 'package:modu_3_dart_study/2025-03-14/cleric_file.dart';
import 'package:test/test.dart';

void main () {

  test("Cleric Given Test", () {

    //준비,실행
      Cleric asus1 = Cleric("아서스", hp: 50, mp: 5);
      Cleric asus2 = Cleric("아서스", hp: 50);
      Cleric asus3 = Cleric("아서스");
      // Cleric asus4 = Cleric(); //error로 인한 주석 처리

    //검증
    expect(asus1, equals(isNotNull));
    expect(asus2, equals(isNotNull));
    expect(asus3, equals(isNotNull));

    expect(asus1.hp, equals(50));
    expect(asus2.hp, equals(50));
    expect(asus3.hp, equals(50));

    expect(asus1.mp, equals(5));
    expect(asus2.mp, equals(10));
    expect(asus3.mp, equals(10));


  });
}





