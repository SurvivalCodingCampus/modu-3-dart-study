### 연산자 (Operators)

##### `~/` 몫

##### `%` 나머지

##### `??=` null이 아닐때만 값을 할당

##### `|=` or연산자

```dart
int a = 5;  // 이진수로 101
a |= 3;     // 이진수로 011과 OR 연산 후 할당
// a는 이제 7 (이진수로 111)이 됨
```



##### Cascade notation

###### **카스케이드 연산자 사용법**

..를 사용하면 특정 객체에 대해 여러 메서드를 호출하거나 속성을 설정할 수 있습니다. 이때, 객체를 매번 참조할 필요 없이 같은 객체를 반환하면서 체이닝 방식으로 작업이 수행됩니다.

```dart
class Person {
  String? name;
  int? age;

  void introduce() {
    print('안녕하세요, 저는 $name이고 나이는 $age살입니다.');
  }
}

void main() {
  var person = Person()
    ..name = '홍길동'
    ..age = 25
    ..introduce();
}
```



##### `...` 스프레드 연산자

###### 1. 리스트에서의 스프레드 연산자

리스트에서 스프레드 연산자는 다른 리스트의 요소를 현재 리스트에 펼쳐서 포함시킵니다.

```dart
void main() {
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  List<int> combinedList = [...list1, ...list2];

  print(combinedList); // [1, 2, 3, 4, 5, 6]
}
```

위 코드에서 `...list1`은 `list1`의 모든 요소를 `combinedList`에 펼쳐서 포함시킵니다. 마찬가지로 `...list2`도 같은 방식으로 동작합니다.

###### 2. 맵에서의 스프레드 연산자

맵에서도 스프레드 연산자를 사용하여 다른 맵의 모든 키-값 쌍을 현재 맵에 추가할 수 있습니다.

```dart
void main() {
  Map<String, int> map1 = {'a': 1, 'b': 2};
  Map<String, int> map2 = {'c': 3, 'd': 4};
  Map<String, int> combinedMap = {...map1, ...map2};

  print(combinedMap); // {a: 1, b: 2, c: 3, d: 4}
}
```

###### 3. 조건부 요소 추가

스프레드 연산자는 조건부 요소 추가에도 사용할 수 있습니다. 조건에 따라 특정 컬렉션의 요소를 포함할지 여부를 결정할 수 있습니다.

```dart
void main() {
  bool shouldAddExtra = true;
  List<int> list = [1, 2, 3, if (shouldAddExtra) ...[4, 5]];

  print(list); // [1, 2, 3, 4, 5]
}
```

###### 4. 중첩 리스트 펼치기

중첩된 리스트의 요소를 하나의 리스트로 평평하게 만들 수도 있습니다.

```dart
void main() {
  List<List<int>> nestedList = [
    [1, 2],
    [3, 4],
    [5, 6]
  ];
  List<int> flatList = [for (var sublist in nestedList) ...sublist];

  print(flatList); // [1, 2, 3, 4, 5, 6]
```

