class Hero {
  String name;
  int hp;

  //생성자 (초기화)
  Hero(this.name, this.hp);

  //메서드
  void attack() {}
  void run() {}
  void sleep() {
    hp = 100;
  }
}

void main() {
  Hero hero = Hero('홍길동', 10); //인스턴스 생성. 클래스를 통해 Hero라는 타입을 만든것. new는 생략 가능
  hero.attack(); //메서드 호출
}