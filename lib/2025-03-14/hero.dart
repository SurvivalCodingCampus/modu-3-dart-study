import 'package:modu_3_dart_study/2025-03-14/sword.dart';
import 'package:modu_3_dart_study/2025-03-14/wizard.dart';

class Hero {
  // -------------------------* 필드 *-------------------------
  static int mp = 100;
  final String name;
  int hp;
  Sword? sword;
  static const int maxHp = 50;

  // -------------------------* 생성자 *-------------------------

  /* 1) Positional Optional 파라미터 생성자 []
      - 순서를 꼭지켜야함.
      - []안의 값 넣지 않으면 null이거나 기본값
  */
  // Hero(this.name, this.hp, [this.sword]);

  /* 2) Named Parameters {required} 또는 :
      - 중괄호 {}로 감싸서 정의
      - 선택적(optional)이며, 기본값을 설정
      - Null Safety 필드 선언시 사용해 null를 판별한다.


       : (이니셜라이저)
       객체가 생성시 인스턴스 변수를 초기화 하는 방법
  */
  Hero({required this.name, required this.hp, this.sword}) {
    print('$name(용사)가 생성되었다. HP: $hp');
  }

  /* 3) 클래스에 생성자는 무조건 한개 이상 */
  // -------------------------* 메서드 *-------------------------
  // [attack] 공격 받았을 시, hp 5씩 줄어드는 함수
  void attack(int demage) {
    print('$demage 의 데미지');
    hp -= demage;
    if (hp <= 0) {
      hp = 0;
      print('[죽음]$name의 HP가 $hp 되어 죽었다 ㅃ2');
    } else {
      print('[공격]으로 $name의 HP가 $hp 되었다.');
    }
  }

  // [run] 용사가 도망가는 함수
  void run() {
    print('$name(용사)이/가 도망간다. 낄낄');
  }

  // [sleep] 잠을 자면서 hp를 100까지 회복하는 함수
  void sleep() {
    hp = 100;
    print('[회복]$name(용사)이/가 잠자서 HP가 $hp로 회복이 되었다.');
  }

  //   // [static 메서드 추가] 돈을 모두 잃는 메서드
  //   static void loseAllMoney() {
  //     Hero.money = 0;
  //     print('💰 모든 돈을 잃었다! 현재 돈: ${Hero.money}');
  //   }

  //   // [static 메서드 추가] 돈을 얻는 메서드
  //   static void earnMoney(int amount) {
  //     Hero.money += amount;
  //     print('💰 $amount 골드 획득! 현재 돈: ${Hero.money}');
  //   }
}

// void main() {
//   /* 얕은 복사 (Shallow Copy) */
//   // : 객체의 내용 자체를 복사하녀 완전히 독립적인 복제본을 만든 것
//   // -> 하나의 인스턴스를 참고하고 있기 때문에 "값도 복사됨"!!

//   /* {required} : named 파라미터 */
//   // final hero1 = Hero('홍길동', 100);
//   final hero1 = Hero(name: '홍길동', hp: 100); // 더 자주사용

//   final hero2 = hero1;
//   hero2.hp = 200;

//   print(hero2.hp); // 200
//   print(hero1.hp); // 200
//   // -> 인스터스의 값 자체가 바꼈음!
// }

void main() {
  Sword riceBag = Sword(name: '백만석', damage: 10);
  Sword brush = Sword(name: '붓', damage: 10);

  Hero hero1 = Hero(name: '홍길동', hp: 100);
  Hero hero2 = Hero(name: '춘향이', hp: 100, sword: riceBag);
  Hero hero3 = Hero(name: '한석봉', hp: 100, sword: brush);
  // Hero hero4 = Hero(name, hp);

  Wizard wizard = Wizard(name: '이몽룡', hp: 50);
}
