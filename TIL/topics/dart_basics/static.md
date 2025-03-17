### static

- 클래스 자체에 귀속되어 클래스 이름만 사용해 호출 가능 ex) Cleric.maxHp
- **컴파일 시 클래스가 메모리에 처음 할당**
- 데이터 영역에 저장되어 프로그램이 종료될 때까지 메모리에 존재함
- class가 공통으로 사용하는 멤버변수를 만듬

```dart
class Cleric {
  String name;
  int? hp;
  int? mp;
  static const int maxHp = 50;
  static const int maxMp = 10;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});
}
```