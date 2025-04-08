abstract class Monster {
  void run() {
    print('뚜벅뚜벅');
  }
}

class Slime extends Monster {
  final String suffix;

  //슬라임 이름
  Slime(this.suffix);

  //상위인 Monster클래스에서 run메서드를 오버라이딩함
  @override
  void run() {
    print('slime $suffix 가 도망쳤다');
  }

  void customPrint() {
    print('hello');
  }
}

void main() {
  Slime slime = Slime('A');
  //여기서 Slime으로 설정했기때문에, 즉 monster의 실체는 Slime이라
  //Monster는 추상클래스라 객체화 불가, 객체화란 아래처럼 클래스로 선언하는것
  Monster monster = Slime('B');
  //둘다 오버라이드 된 slime의 run으로 결과 출력됨.
  slime.run();
  //이 경우 실행이 안됨. 왜냐하면 Slime으로 객체를 만들지만 변수의 타입은 Monster이기때문에
  //Monster에는 print메서드가 없어서 출력이 안됨
  // monster.print();
  slime.customPrint();
  monster.run();
}

// void main() {
//   Hero hero = Hero(name: 'name', hp: 100);
//   // print(hero);
//   //
//   // final heroes = <Hero>[];
//   // final h1 = Hero(name: '슈퍼맨', hp: 100);
//   // final h2 = Hero(name: '슈퍼맨', hp: 100);
//   // heroes.add(h1);
//   // print(heroes.length);
//   // heroes.remove(h2);
//   // print(heroes.length);
//   final names = ['김현수', '이지금', '박미자'];
//   names.sort((a, b) => a.compareTo(b));
//   print(names);
//   names.sort((a, b) => a.compareTo(b) * -1);
//   print(names);
// }
