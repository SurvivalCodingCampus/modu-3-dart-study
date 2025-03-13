/* 클래스 */
// 객체를 생성하기 위한 설계도
// 데이터의 속성과 메소드를 정의
class Hero {
  /* 필드 */
  // 속성을 정의한다.
  String name;
  int hp;

  /* 생성자 */
  Hero(this.name, this.hp) {
    // 인스턴스 생성 시마다 프린트 구분
    print('$name(용사)가 생성되었다. HP: $hp');
  }

  /* 메서드 */
  // - 공격 받았을 시, hp 5씩 줄어드느 함수
  void attack() {
    hp -= 5;
    print('[공격]으로 $name의 HP가 $hp 되었다.');
  }

  // - 용사가 도망가는 함수
  void run() {
    print('$name(용사)이/가 도망간다. 낄낄');
  }

  // - 잠을 자면서 hp를 100까지 회복하는 함수
  void sleep() {
    print('[회복]$name(용사)이/가 잠자서 HP가 $hp로 회복이 되었다.');
  }
}

// void main() {
//   //  Hero 클래스로 두개의 인스턴스 생성
//   Hero heroBunny = Hero('jilong🐰', 100);
//   Hero heroTiger = Hero('youngQ🐯', 80);

//   // heroBunny 공격받고 잠자서 회복하기
//   heroBunny.attack();
//   heroBunny.sleep();

//   // heroTiger 도망가다 공격받기
//   heroTiger.run();
//   heroTiger.attack();
// }
