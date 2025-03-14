## Named Parameter

- 인수를 중괄호 감싸서 사용한다.
- 기본 값도 적용할 수 있다.
- 데이터 타입이 `null`을 허용하지 않으면 `required`를 붙여야 함

```dart
int sum({int x = 1, int y = 2}) {
	...
}
```

## 필수 파라미터와 이름 지정 파라미터

```dart
class Hero {
	String name;
	int hp;
	Sword? sword;

	Hero(this.name, this.hp, { this.sword });
}
```

- 이름 지정 파라미터와 일반 파라미터를 함께 사용하는 경우
  - 일반 파라미터는 필수 파라미터가 됨
  - 이름 지정 파라미터는 옵셔널이 됨
- 마지막 이름 지정 파라미터 중괄호 뒤에는 다른 파라미터가 존재 할 수 없다.

## required

- 이름 지정 파라미터에 `required` 키워드를 적용해서 필수 파라미터로 만들 수 있다.

## 참고

[Dart 공식문서 - Functions](https://dart.dev/language/functions)
