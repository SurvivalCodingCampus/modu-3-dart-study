//연습문제 3 : A,B클래스의 인스턴스를각각 1개씩 생성하여 List로 차례로 담는다
import 'polymorphism.dart';

//Alphabet이라는 추상클래스를 만들고 b라는 메서드를 넣고 Alphabet클래스를 리스트로 만듬
void main() {
  final alphabet = <Alphabet>[];
  alphabet.add(A());
  alphabet.add(B());
  alphabet.forEach((alphabet) {
    alphabet.b();
  });
}
