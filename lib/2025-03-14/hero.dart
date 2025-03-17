import 'package:modu_3_dart_study/2025-03-14/sword.dart';

class Hero {
  // 정적인 변수
  static int money = 100;
  String name;
  int hp;
  Sword? sword;

  // Hero(this.name, this.hp) 기본 생성자 생성 방식
  // 기본생성자 방식보다 많이 씀. 순서 상관없이 쓸 수 있고, 이름때문에 알아보기 쉬움.
  // required 없으면 필수가 아님.
  Hero({required this.name, this.hp = 100, this.sword});

  //메서드
  void attack() {}
  // 정적 메소드. 클래스와 물리적으로 분리됨. 클래스는 이 메서드를 못봄. Static 끼리는 접근 가능. 메모리 공간이 같아서.
  static void run() {
    Hero.money = 200;
    Hero hero = Hero(name: 'name', hp: 100);
    hero.name;
  }
  void sleep() {
    hp = 100;
  }
}

void main() {
  Hero hero = Hero(name: '홍길동', hp: 10); //인스턴스 생성. 클래스를 통해 Hero라는 타입을 만든것. new는 생략 가능
  print(Hero.money);
}