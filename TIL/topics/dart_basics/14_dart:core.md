## dart:core



### map()

- 컬렉션의 각 요소를 변환하여 새로운 컬렉션을 반환

```dart
final numbers = [1, 2, 3];
final doubled = numbers.map((e) => e * 2); // [2, 4, 6]
```



### Where()

- Swift의 filter와 동일한 역할로, 조건에 맞는 요소만 필터링
- `Iterable`로 반환

```dart
final numbers = [1, 2, 3, 4, 5];
final evens = numbers.where((e) => e % 2 == 0); // [2, 4]
```



### reduce()

- 컬렉션의 요소들을 하나의 값으로 결합
- 초기값 없음

```dart
final numbers = [1, 2, 3, 4];
final sum = numbers.reduce((value, element) => value + element); // 10
```

#### max 활용



```dart
List<int> numbers = [3, 5, 2, 9, 4];
int maxValue = numbers.reduce(max);
print(maxValue); // 출력: 9
```



### fold()

- 초기값을 지정할 수 있습니다
- 반환 타입이 컬렉션의 요소 타입과 달라도 됩니다

```dart
// fold 사용 예시 1: 숫자 리스트의 합계 (초기값 0)
final numbers = [1, 2, 3, 4];
final sum = numbers.fold(0, (sum, item) => sum + item); // 10

// fold 사용 예시 2: 숫자 리스트를 문자열로 변환 (다른 타입 반환)
final numbers = [1, 2, 3];
final result = numbers.fold('', (str, item) => str + item.toString()); // "123"
```





이렇게 선언하면 오류가 난다. 초기값의 타입을 기반으로 추론하기 때문에 0을 초기값으로 넣으면 Object 타입으로 간주하기 때문

```dart
void main() {
  var l = [1, 2, 3];
  print(l.fold<int>(0, (p, e) => p + e)); // 출력: 6
}
```



### forEach()

각 요소에 대해 특정 동작을 수행

```dart
final fruits = ['apple', 'banana'];
fruits.forEach((fruit) => print(fruit));
```



### any()

- 조건을 만족하는 요소가 하나라도 있는지 확인

```dart
final numbers = [1, 2, 3];
final hasEven = numbers.any((e) => e % 2 == 0); // true
```



### every()

모든 요소가 조건을 만족하는지 확인

```dart
final numbers = [2, 4, 6];
final allEven = numbers.every((e) => e % 2 == 0); // true
```









### sort()

### compareTo

- 이것이 other보다 작으면 음수를 반환하고, 같으면 0을, other보다 크면 양수를 반환합니다.
- 기본값은 **오름차순**이라 생각하면 편함

