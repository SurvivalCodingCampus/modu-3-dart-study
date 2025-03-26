### **함수형 프로그래밍(FP, Functional Programming)**은 **객체지향 프로그래밍(OOP, Object-Oriented Programming)의 몇 가지 문제점**을 보완하기 위해 등장했어. 사실, 객체지향 프로그래밍(OOP)만으로도 많은 문제를 해결할 수 있지만, **OOP가 가진 한계를 극복하기 위해 FP가 발전함**.

---

## ✅ **1. 객체지향 프로그래밍(OOP)의 주요 문제점**

객체지향 프로그래밍은 현실 세계를 모델링하는 데 강력한 도구지만, 몇 가지 한계가 있음.

### ❌ **(1) 상태 변화(Mutable State)로 인한 오류 발생**

- OOP에서는 객체의 상태(변수 값)를 변경하는 방식으로 동작.
- 하지만 프로그램이 복잡해질수록 **상태 변경을 추적하기 어려워지고**, 원하지 않는 부작용이 발생할 가능성이 커짐.

```dart
dart
복사편집
class Counter {
  int count = 0;

  void increment() {
    count++;
  }
}

void main() {
  Counter counter = Counter();
  counter.increment();
  counter.increment();
  print(counter.count);  // ✅ 2 (하지만 상태 변경을 추적하기 어려울 수 있음)
}

```

🔥 **문제점**: 여러 객체가 **공유된 상태(Shared State)**를 변경하면, 예상치 못한 버그가 발생할 가능성이 커짐.

---

### ❌ **(2) 객체 간의 강한 결합(Tight Coupling)**

- OOP는 **객체 간의 상호작용**을 중심으로 하기 때문에, 객체 간의 **의존성이 강하게 연결될 수 있음**
- 강한 결합은 유지보수를 어렵게 하고, 변경 사항이 여러 부분에 영향을 미칠 수 있음.

```dart
dart
복사편집
class Engine {
  void start() => print("Engine starting...");
}

class Car {
  Engine engine = Engine();

  void drive() {
    engine.start();
    print("Car is moving...");
  }
}

void main() {
  Car car = Car();
  car.drive();
}

```

🔥 **문제점**:

- `Car` 클래스는 `Engine` 클래스에 **강하게 결합(Tightly Coupled)**되어 있어서,

  만약 `Engine`을 다른 엔진(`ElectricEngine` 등)으로 변경하고 싶다면 `Car` 클래스를 수정해야함

- 이런 **의존성이 많아지면 유지보수가 어려워짐.**

---

### ❌ **(3) 동시성(Concurrency) 문제**

- OOP에서는 **공유된 상태**를 여러 스레드가 수정하면, 동기화 문제가 발생할 수 있어.
- 이를 해결하려면 **락(Lock)** 같은 복잡한 동기화 메커니즘이 필요.

```dart
dart
복사편집
class SharedResource {
  int value = 0;

  void increment() {
    value++;
  }
}

void main() {
  SharedResource resource = SharedResource();

  // 두 개의 스레드에서 동시에 값 변경 (실제로는 isolate 사용 필요)
  resource.increment();
  resource.increment();

  print(resource.value);  // 예측 불가능한 값이 나올 수 있음
}

```

🔥 **문제점**: 여러 스레드가 `value`를 동시에 변경하면 **레이스 컨디션(Race Condition)**이 발생할 수 있음.

---

## ✅ **2. 함수형 프로그래밍(FP)이 해결하는 문제**

함수형 프로그래밍은 **OOP의 한계를 극복하기 위해 등장**.

FP는 **함수를 1급 객체(First-Class Citizen)로 사용하고, 상태 변경을 최소화하며, 순수 함수(Pure Function)를 지향**.

---

### ✅ **(1) 불변성(Immutability) → 상태 변경 문제 해결**

- FP에서는 **변수를 변경하지 않고**, 새로운 값을 반환하는 방식을 사용해.
- 상태가 변하지 않으므로, **디버깅이 쉬워지고 오류가 줄어듦**.

```dart
dart
복사편집
int add(int a, int b) => a + b;  // 상태를 변경하지 않음

void main() {
  int result = add(3, 5);
  print(result);  // ✅ 8 (상태 변화 없음)
}

```

🔥 **장점**:

- 기존 값을 변경하지 않으므로, **예측 가능한 코드**를 작성할 수 있음.
- 멀티스레드 환경에서도 **동기화 문제**가 발생하지 않음.

---

### ✅ **(2) 함수의 조합(Composition)으로 강한 결합 해결**

- FP에서는 **작은 함수들을 조합**해서 복잡한 기능을 만듦.
- 객체 간의 의존성이 약해지고, 재사용성이 높아짐.

```dart
dart
복사편집
int doubleIt(int n) => n * 2;
int squareIt(int n) => n * n;

void main() {
  int result = doubleIt(squareIt(3));  // ✅ 3^2 = 9, 9 * 2 = 18
  print(result);  // 18
}

```

🔥 **장점**:

- 함수를 조합해서 사용하면 **강한 결합이 사라지고, 재사용성이 증가**.

---

### ✅ **(3) 동시성(Concurrency) 문제 해결**

- FP에서는 **상태를 변경하지 않으므로**, 여러 스레드에서 안전하게 실행할 수 있음.

```dart
dart
복사편집
List<int> numbers = [1, 2, 3, 4, 5];

List<int> doubled = numbers.map((n) => n * 2).toList();  // ✅ 상태 변경 없음

void main() {
  print(doubled);  // [2, 4, 6, 8, 10]
}

```

🔥 **장점**:

- 리스트의 `map()` 함수는 **각 요소를 독립적으로 변환**하므로, 멀티스레드에서도 안전함.

---

## ✅ **3. 그럼 OOP 없이 FP만 써도 될까?**

💡 **아니! 둘 다 필요해.**

- **FP가 OOP를 완전히 대체할 필요는 없음.**
- 현실 세계의 문제를 모델링할 때는 **OOP가 강력한 도구**.
- 하지만, **FP의 불변성, 함수 조합 등의 개념을 OOP에 적용하면 더 좋은 코드**를 만들 수 있음.
- 그래서 **"함수형 프로그래밍 스타일을 포함한 객체지향 프로그래밍"**이 현대적인 개발 방식에서 자주 사용.

---

## 🚀 **결론**

🔹 **OOP의 문제점**: 상태 변화, 강한 결합, 동시성 문제

🔹 **FP가 해결하는 점**: 불변성, 함수 조합, 멀티스레드 안전성

🔹 **둘 다 장점이 있으므로, OOP와 FP를 함께 사용하는 것이 이상적**

즉, 함수형 프로그래밍은 **OOP의 한계를 보완하는 개념**이지, OOP를 없애기 위한 개념은 아님!