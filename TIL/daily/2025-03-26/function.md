## 1급 객체란?

1급 객체란, **`변수에 대입하거나 다른 함수의 매개변수 또는 반환값으로 사용이 가능한 객체`**를 의미합니다.

대표적인 **1급 객체**의 예는 **`값(Value)`**, **`인스턴스(Instance)`**,  **`함수(Function)`**

---

## 함수와 관련된 개념

### 1. 함수(function)

- 함수도 **`1급 객체`**로 취급됩니다.
- **`동일한 입력값**에 대해 항상 **동일한 출력값**`을 반환해야 합니다.*(*
    
    *이를 함수형 프로그래밍의 특징인 "순수 함수"로 칭합니다.)*
    
    ```dart
    f(x) = 2x+3
    ```
    

### 2. 메서드와 함수의 차이

<aside>

메서드는 클래스에 속하고 클래스를 조작하기 위한 일종의 함수이다. 

메서드는 이름이 있고  함수는 이름이 중요하지 않다 있어도 되고 없어도 되고~

</aside>

---

## 람다식 함수 **(Lambda Expression)**

람다식은 **함수를 간결하게 표현**하는 방식입니다. 화살표 연산자(`⇒`)를 사용하여 하나의 식(expression)을 반환합니다.

람다식은 주로 **`간단한 연산을 수행하는 함수`**를 정의할 때 사용됩니다.

```dart
int sum(int a, int b) => a + b;
```

## **익명함수 (Anonymous Function)**

익명 함수는 **`이름이 없는 함수`**를 의미합니다.

일반적으로 **필요한 순간에만 사용되는 일시적인 함수**를 정의할 때 사용됩니다.

⇒ 재사용성이 없음!

```dart
nums.forEach((int value) {
  print(value);
});
```

---

## 함수형 프로그래밍

- 다트는 객체지향 프로그래밍(OOP)과 함수형 프로그래밍(FP) 특징을 모두 제공하는 멀티 패러다임 언어입니다.
- 함수형 프로그래밍은 자료 처리를 수학적 함수의 계산으로 취급하는 프로그래밍 패러다임이고 가변 데이터를 멀리하는 특징을 가집니다

---

## 고계함수(higher-order function)

: 고계 함수는 **다른 함수를 매개변수로 받거나 결과값으로 반환하는 함수**를 의미한다.

## 고계함수의 특징

- 함수를 매개변수로 받을 수 있다
- 함수를 반환값으로 반환할 수 있다.
- **로직을 간결하고 재사용 가능하게 만들어줌**

---

## 대표적인 고계함수

<aside>

`List`는 Dart에서 고계 함수를 지원하는 다양한 메소드를 제공합니다. 대표적으로 **`where`**, **`map`**, **`forEach`**, **`reduce`**, **`any`** 등이 있습니다

</aside>

### 📍where : 조건 필터링

리스트의 요소 중 **특정 조건을 만족하는 요소만 필터링**하여 반환합니다.

```dart
for (var i = 0; i < items.length; i++) {
  if (items[i] % 2 == 0) {
    print(items[i]);
  }
}
```

```dart
items.where((e) => e % 2 == 0).forEach(print);
```

### 📍map : 변환

리스트의 **모든 요소를 변환**하여 새로운 값을 가진 컬렉션을 반환합니다.

```dart
for (var i = 0; i < items.length; i++) {
    if (items[i] % 2 == 0) {
      print('숫자 ${items[i]}');
    }
  }
```

```dart
// 텍스트 변환
items.where((e) => e % 2 == 0).map((e) => '숫자 $e').forEach(print);

// 출력 결과
// 숫자 2
// 숫자 4
```

### 📍forEach : 전체 뺑뺑이

리스트의 **모든 요소를 순회**하며 작업을 수행. 단, 반환값은 없습니다.

```dart
// forEach 사용
List<int> toListList = items.where((e) => e % 2 == 0).toList();

// 출력 결과
// 2
// 4

```

### 📍 reduce : 하나씩 줄이기

리스트의 요소를 차례로 **하나씩 결합**하여 단일 값을 만듭니다.

```dart
var maxResult = items[0];
  for (var i = 0; i < items.length; i++) {
    maxResult = max(items[i], maxResult);
  }
  print(maxResult);
```

```dart
print(items.reduce((v, e) => max(v, e)));
```

### 📍 toList : 배열

```dart
  List<int> toListList = items.where((e) => e % 2 == 0).toList();
  print(toListList);
```

### 📍toSet : 중복 제거

```dart
 final items1 = [1, 2, 2, 3, 3, 4, 5];
  var result = [];
  var temp = <int>{};
  for (var i = 0; i < items.length; i++) {
    if (items1[i] % 2 == 0) {
      temp.add(items[i]);
    }
  }
  result = temp.toList();
  print(result); //2,4
```

```dart
final toSetResult = items1.where((e) => e % 2 == 0).toSet().toList();
  print(toSetResult);
```

### 📍any : 있는지 없는지

```dart
  var boolResult = false;
  for (var i = 0; i < items.length; i++) {
    if (items[i] % 2 == 0) {
      boolResult = true;
      break;
    }
  }
  print(boolResult);
```

```dart

  print(items1.any((e) => e % 2 == 0));
```

## 추가

### 📍 정렬 고계함수 활용

아래 두개 동일한 기능 동일한 출력값 제공

```dart
final List<String> cambridgeTrader =
    transactions
        .where((e) => e.trader.city == 'Cambridge') // 조건 필터링
        .map((e) => e.trader.name)                 // 이름만 추출
        .toSet()                                  // 중복 제거
        .toList()                                 // 리스트로 변환
      ..sort((a, b) => a.compareTo(b));           // 이름 기준 정렬
```

```dart
List<String> cambridgeTrader2 =
      transactions
          .where((e) => e.trader.city == 'Cambridge')
          .map((e) => e.trader.name)
          .toList();
  cambridgeTrader2.sort((a, b) => a.compareTo(b));
```

### `.sort`는

    - 원래 리스트를 정렬하지만 결과를 돌려주지 않아요 (리턴값이 없음).
    - 대신 리스트 자체를 정렬된 상태로 바꿔요.

### `..sort`는

    - Cascade Operator(..)를 사용해서
    - 리스트를 정렬하고, **정렬된 리스트를 다시 반환**할 수 있어요.
    - 그래서 체이닝(겹쳐서 이용)이 가능해요! 😊

    `..` 체이닝이란, 객체나 리스트에 여러 작업을 이어서 실행

---

## **고계 함수의 장단점**

### **장점**

- **코드 재사용성 증가**: 동일한 작업을 함수로 만들어 재사용 가능.
- **코드 간결성**: 작업을 짧고 명확하게 작성 가능.
- **가독성 향상**: 데이터 처리 로직을 직관적으로 표현.
- **모듈화**: 특정 작업 로직을 별도로 정의하여 유지보수 용이.

### **단점**

- 제어 흐름(`break`, `continue`) 제약.
- 복잡하거나 세밀한 작업에서는 적합하지 않을 수 있음.
- 익숙하지 않은 입문자들에게는 직관성이 떨어질 수 있음.