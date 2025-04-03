import '../../../lib/assignments/basic/2025-03-13/slime.dart';
import 'package:test/test.dart';

void main(){
  test("slime 생성자 및 메서드 테스트", (){
    // given
    final slime1 = Slime(10, "슬라임1");
    final slime2 = Slime(10, "슬라임2");

    // when
    slime1.run();
    slime2.run();

    // then
    // print문이 잘 작성되는지 확인
  });
}