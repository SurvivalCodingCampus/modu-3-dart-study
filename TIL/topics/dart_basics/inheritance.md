### 상속(inheritance)

- 재사용
- 추가, 수정에 시간 단축
- 소스파악 관리 용이
- extends 사용
- 부모의 모든걸 받아옴

```dart
void main() {
  final superHero = SuperHero(name: 'name', hp: 100);
  superHero.run(); // Hero에 있는 run 메서드를 superHero에서도 사용 가능
}
//extends를 활용해 Hero라는 부모클래스를 상속받음
class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp}); // alt + enter로 자동 생성
}
```

오버로드 (overload)  같은 이름을 재사용

오버라이드 (override) 기존 기능을 재정의

```dart
//override
void main() {
  final superHero = SuperHero(name: 'name', hp: 100);
  // super.run을 먼저 실행하고 print('멋지게 뛰었다') 실행됨
  superHero.run();
}

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp}); // alt + enter로 자동 생성
  @override //부모의 run과 다른 기능을 구현하고 싶을때 사용
  void run() {
    super.run(); //super는 부모(hero), this는 나
    print('멋지게 뛰었다');
  }
}
```

"is-a 원칙"
= Superhero is hero
= 슈퍼히어로는 히어로의 한 종류이다.
= 즉 말이 되야함

잘못된 상속

- 현실세계와 모순이 생김
- 다형성을 이용할 수 없음

다형성이란?
: 객체지향 프로그래밍에서 하나의 인터페이스(부모 클래스)가 여러개의 구현(자식 클래스)를 갖는 개념

### 구체화와 일반화의 관계

자식(sub)클래스 일 수록 **구체화**
부모(super) 클래스 일 수록 **추상적인** 것으로
**일반화** 됨.
