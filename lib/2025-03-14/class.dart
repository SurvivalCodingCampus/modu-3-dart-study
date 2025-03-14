

void main() {
  Hero hero1 = Hero(name: "히어로1", hp: 50);
  Hero hero2 = hero1;
  hero2.hp = 200;

  //결과값은? 둘다 200
  print(hero1.hp);
  print(hero2.hp);
}

class Hero {
  static int money = 100;
  String name;
  int hp;
  Sword? sword;

  //생성자
  Hero({required this.name, required this.hp, this.sword});

  //메소드
  void attack() {}

  void run() {}

  void sleep() {}
}

class Sword {
  String name;
  int damage;

  Sword({required this.name, required this.damage});
}

class Wizard {
  String name;
  int hp;
  int mp;

  Wizard({required this.name, required this.hp, required this.mp});

  void heal(Hero hero) {
    hero.hp += 10;
    print('${hero.name}의 hp를 10 회복했습니다.');
  }
}


