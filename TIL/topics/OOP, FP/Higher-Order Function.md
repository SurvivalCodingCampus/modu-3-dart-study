# 📌 **고계함수(Higher-Order Function)에서 실행 결과 예측이 어렵다는 의미**

### 

고계함수(Higher-Order Function, HOF)는 **다른 함수를 인자로 받거나, 함수를 반환하는 함수**.

이런 함수들은 **전달된 함수(콜백 함수)**에 따라 실행 결과가 달라지기 때문,

잘못 사용하면 예측하기 어려운 코드가 될 수도 있음.

---

## ✅ **1. 고계함수가 예측하기 어려운 경우**

### ❌ **(1) 인자로 받은 함수의 동작이 예측되지 않음**

고계함수는 **함수를 인자로 받기 때문에**,

**어떤 함수가 들어오느냐에 따라 실행 결과가 완전히 달라질 수 있음.**

예를 들어:

```dart
dart
복사편집
void execute(Function callback) {
  print("Executing function...");
  callback();
}

void main() {
  execute(() => print("Hello!"));  // "Hello!" 출력
  execute(() => print(42));        // "42" 출력
  execute(() => throw Exception("Error!"));  // ❌ 에러 발생!
}

```

🔥 **문제점**:

- `execute()`는 실행하는 함수(`callback()`)에 따라 결과가 달라짐.
- `Exception`을 던지는 함수를 전달하면 프로그램이 중단될 수도 있음.

✅ **해결 방법**:

- **콜백 함수의 동작을 제한하거나, 예외 처리를 추가**해야 함.

```dart
dart
복사편집
void safeExecute(Function callback) {
  try {
    print("Executing function...");
    callback();
  } catch (e) {
    print("Caught an error: $e");
  }
}

```

---

### ❌ **(2) 상태를 변경하는 함수가 전달될 때 예측 불가**

고계함수의 인자로 **상태를 변경하는 함수(부작용이 있는 함수)**가 전달되면,

실행 결과가 **예측하기 어려워지고 디버깅이 힘들어질 수 있어**.

```dart
dart
복사편집
int globalCounter = 0;

void incrementCounter() {
  globalCounter++;
}

void execute(Function callback) {
  callback();
}

void main() {
  execute(incrementCounter);
  execute(incrementCounter);
  execute(incrementCounter);

  print(globalCounter);  // ❓ 몇이 출력될까?
}

```

🔥 **문제점**:

- `execute()`가 몇 번 호출되었는지 **파악하기 어렵고**,
- `globalCounter` 값이 언제 변경되는지 추적하기 어려움.

✅ **해결 방법**:

- *부작용이 없는 함수(순수 함수)**를 전달하도록 해야 함.
- 즉, **고계함수의 인자로 전달할 함수는 가급적 상태를 변경하지 않도록 설계하는 것이 좋음.**

---

## ✅ **2. 예측하기 쉬운 고계함수 사용 방법**

고계함수가 예측하기 어려운 경우를 줄이려면:

1️⃣ **순수 함수(Pure Function)를 사용**

- 같은 입력에 대해 항상 같은 출력을 반환해야 함.

  2️⃣ **상태를 변경하는 함수(부작용 함수)는 피하기**

  3️⃣ **예외 처리를 통해 안전하게 실행**


✅ **예측 가능한  예시**

```dart
dart
복사편집
List<int> applyOperation(List<int> numbers, int Function(int) operation) {
  return numbers.map(operation).toList();
}

void main() {
  List<int> nums = [1, 2, 3, 4, 5];

  var squared = applyOperation(nums, (n) => n * n);
  print(squared);  // [1, 4, 9, 16, 25] (예측 가능!)

  var doubled = applyOperation(nums, (n) => n * 2);
  print(doubled);  // [2, 4, 6, 8, 10] (예측 가능!)
}

```

🔥 **장점**:

- `applyOperation()`은 상태를 변경하지 않고, **입력값에 따라 항상 예측 가능한 결과**를 반환.

---

## 🚀 **결론**

- *"고계함수의 실행 결과가 예측되지 않는다"**는 의미는,

✅ **고계함수 자체가 문제가 아니라, 인자로 전달되는 함수가 예측 불가능할 때 문제가 발생할 수 있다**는 뜻.

✅ 특히, 상태를 변경하는 함수(부작용 함수)나 예외를 발생시키는 함수가 들어오면 **결과를 예측하기 어려워짐**.

✅ 따라서 **순수 함수만 사용하고, 예외 처리를 추가하면 고계함수를 안전하게 사용할 수 있음!**