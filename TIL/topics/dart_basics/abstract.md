Dart class tools = alt + enter 누르면 test코드 작성 가능
lib를 기본 으로 하기 때문에 test코드가 lib를 기반으로 함
파일 내부 구조를 바꿀때 :

test 코드 작성할때 매직넘버 최소한으로 줄이기
test시 자주 사용되는 숫자들은 윗쪽에 미리 선언해두고 재사용

1. 터미널에서 code . 쳐서 vscode 실행
2. vscode에서 파일 구조 변경
3. 안드로이드스튜디오에서 새로고침

int damage = 100 / 5; => 20.0
double damage = 100 ~/ 5; =>몫만 즉 20

### 추상 클래스

* 상속의 재료로 사용되는 클래스
* 상세 부분이 일부 미정의 된 클래스
* 추상클래스를 만들면 오버라이드가 강제됨
* 추상클래스는 인스턴스화가 금지
* 상위 클래스 간소화, 하위 클래스 구체화

```dart
//추상클래스
abstract class Character {
  String name;
  int hp;

  Character({required this.name, required this.hp});

  void attack(Slime slime);
}
```

### 인터페이스

1. 모든 메소드는 추상 메소드여야함
2. 필드를 가지면 안됨
3. 여러기능을 동시에 구현할 수 있께 해줌

```dart
abstract interface class Character {
  void speak();
}
```

### 인터페이스의 구현 (implement)

**- implement를 사용하면 부모 클래스의 모든 내용을 재정의 해야함!!**

```dart
abstract interface class Attackable {
  void attack(Slime slime);
}
//attackable, movable이라는 추상클래스를 만들면 같이 쓸 수 있음
class Hero implements Attackable, Movable {
  final String name;
  final int hp;

  //Attackable이란 추상클래스에 attack이란 메서드가 있고 그걸 다시한번 재정의
  @override
  void attack(Hero hero) {
    print('공격');
  }

  @override
  void move(Hero hero) {
    print('이동');
  }
}
```

| 사용 방식         | `extends Thing` | `implements Thing`  |
|---------------|-----------------|---------------------|
| 부모 클래스의 필드 사용 | ✅ 가능            | ❌ 직접 구현해야 함         |
| 메서드 재정의       | 선택적 (필요할 때만)    | 모든 메서드 강제 구현        |
| 추상 메서드 처리     | 반드시 구현해야 함      | 반드시 구현해야 함          |
| 다중 상속 가능 여부   | ❌ 불가능           | ✅ 여러 개의 인터페이스 구현 가능 |

