## 추상 클래스

- `abstract` 키워드로 정의
- 추상 클래스는 인스턴스화 할 수 없음
- 추상 클래스는 추상 메서드를 가짐, 추상 메서드는 자식 클래스에서 반드시 정의해야 함
- 하나 이상의 구현을 가지게 되면 추상 클래스
- 자바와 동일

```dart
abstract class Clazz {
	...
}
```

## 순수 추상 클래스

- [용어 - 순수 추상 클래스](https://en.wikibooks.org/wiki/C%2B%2B_Programming/Classes/Abstract_Classes/Pure_Abstract_Classes)
- [stackoverflow - 순수 추상 클래스와 추상 클래스의 차이](https://stackoverflow.com/questions/15253642/what-is-the-difference-between-abstract-class-and-pure-abstract-class-in-c)
- 구현 없이 순수히 추상 메서드로 이루어 진 경우 순수 추상 클래스라 함
- C++의 경우 인터페이스가 없음, C++에서 주로 사용하는 용어

## 인터페이스

- 순수 추상 클래스(Pure Abstract Classe)일 경우 `interface` 키워드를 붙여서 인터페이스를 정의 가능
- 자바와 동일

```dart
abstract interface Attackable {
	...
}
```
