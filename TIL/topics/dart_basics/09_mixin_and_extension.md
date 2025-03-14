### 믹스인 (Mixins)

### Metadata

코드에 대한 추가 정보

```dart
class Television {
  @Deprecated('Use turnOn instead')
  void activate() {
    turnOn();
  }
  // ···
}

```



### Todo

```dart
@Todo('Dash', 'Implement this function')
void doSomething() {
  print('Do something');
}
```



#### MIxin vs Interface vs Abstract Class 비교

##### 1️⃣ 믹스인 (Mixin)**



**✅ 개념**

- *“코드를 재사용”**하기 위한 기능.**
- **다중 상속이 불가능한 Dart에서 **다양한 기능을 추가**하는 방법.
- with 키워드를 사용해서 적용.
- 객체를 생성할 수 없으며, 직접 인스턴스화(new MixinName())할 수 없음.

**✅ 예제**

```dart
mixin Flyable {
  void fly() {
    print("날고 있어요! 🕊️");
  }
}

class Bird with Flyable {} // 믹스인 추가

void main() {
  Bird bird = Bird();
  bird.fly(); // 출력: 날고 있어요! 🕊️
}
```

**✅ 특징**

- 다중 믹스인 가능 → class A with B, C, D {}
- extends 없이 기존 클래스에 **기능만 추가 가능**
- *상태(변수)**를 가질 수 있지만 **생성자는 가질 수 없음**

##### **2️⃣ 인터페이스 (Interface)**

**✅ 개념**

- *“규칙(규격)을 정의”**하는 역할.
- 클래스가 특정한 메서드를 반드시 구현하도록 강제.
- Dart에서는 **모든 클래스가 인터페이스처럼 사용 가능**.
- implements 키워드를 사용하여 인터페이스를 구현해야 함.
- 반드시 인터페이스에 정의된 모든 메서드를 **오버라이딩(재정의)** 해야 함.



**✅ 예제**

```dart
// 인터페이스 역할을 하는 클래스
class Animal {
  void makeSound(); // 선언만 하고 구현 X (추상 메서드)
}

class Dog implements Animal {
  @override
  void makeSound() {
    print("멍멍! 🐶");
  }
}

void main() {
  Dog dog = Dog();
  dog.makeSound(); // 출력: 멍멍! 🐶
}
```

**✅ 특징**



-  implements를 사용하면 **여러 개의 인터페이스를 구현 가능**
-  인터페이스를 구현하는 클래스는 **반드시 모든 메서드를 구현해야 함**
-  *변수, 구현된 메서드, 생성자를 가질 수 있음**

##### **3️⃣ 추상 클래스 (Abstract Class)**



**✅ 개념**

- *“공통적인 기능을 제공하면서, 일부는 구현을 강제”**하는 클래스.
- abstract 키워드를 사용하여 정의.
- 객체를 직접 생성할 수 없음 (new AbstractClass() 불가능).
- extends 키워드를 사용해서 상속받음.
- 일부 메서드는 구현할 수도 있고, 일부는 **구현을 강제할 수도 있음(추상 메서드).**



**✅ 예제**

```dart
abstract class Animal {
  void makeSound(); // 구현 X (추상 메서드)

  void sleep() { // 구현 O (일반 메서드)
    print("쿨쿨... 😴");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("야옹! 🐱");
  }
}

void main() {
  Cat cat = Cat();
  cat.makeSound(); // 출력: 야옹! 🐱
  cat.sleep(); // 출력: 쿨쿨... 😴
}
```

**✅ 특징**



- ✔️ extends로 상속받으면 **이미 구현된 메서드는 그대로 사용 가능**
- ✔️ **추상 메서드**는 반드시 오버라이딩해야 함
- ✔️ **생성자 사용 가능**

**4️⃣ 차이점 정리 (표)**

|                     | **Mixin**        | **Interface**                   | **Abstract Class**         |
| ------------------- | ---------------- | ------------------------------- | -------------------------- |
| **목적**            | 기능 추가        | 규칙 정의                       | 공통 기능 제공 + 일부 강제 |
| **키워드**          | with             | implements                      | abstract + extends         |
| **메서드 구현**     | 가능             | ❌ (반드시 재정의해야 함)        | 가능 (선택적)              |
| **변수 사용**       | 가능             | 가능                            | 가능                       |
| **생성자**          | ❌                | 가능                            | 가능                       |
| **다중 사용 가능?** | ✅ (여러 개 가능) | ✅ (여러 개 가능)                | ❌ (단일 상속만 가능)       |
| **객체 생성 가능?** | ❌                | ❌ (인터페이스 자체는 생성 불가) | ❌                          |

**5️⃣ 실전 예제 (Mixin + Interface + Abstract Class 조합)**



**🚀 “날 수 있는 동물” 시스템을 만들자!**

- **Animal(추상 클래스)** → 공통 기능 제공
- **Flyable(믹스인)** → 날 수 있는 기능 추가
- **Bird(인터페이스)** → “새” 카테고리를 정의

```dart
abstract class Animal {
  void makeSound(); // 모든 동물은 소리를 냄 (구현 강제)

  void sleep() {
    print("쿨쿨... 😴");
  }
}

// 믹스인 (추가 기능)
mixin Flyable {
  void fly() {
    print("날고 있어요! 🕊️");
  }
}

// 인터페이스 (새 카테고리)
class Bird {
  void layEggs(); // 모든 새는 알을 낳아야 함 (강제)
}

// 상속 + 믹스인 + 인터페이스 조합!
class Parrot extends Animal with Flyable implements Bird {
  @override
  void makeSound() {
    print("앵무새 소리! 🦜");
  }

  @override
  void layEggs() {
    print("앵무새가 알을 낳았어요! 🥚");
  }
}

void main() {
  Parrot parrot = Parrot();
  parrot.makeSound(); // 출력: 앵무새 소리! 🦜
  parrot.fly(); // 출력: 날고 있어요! 🕊️
  parrot.layEggs(); // 출력: 앵무새가 알을 낳았어요! 🥚
  parrot.sleep(); // 출력: 쿨쿨... 😴
}
```

**✅ 이 코드에서 중요한 점**



- ✔️ Animal은 **추상 클래스**로 기본 기능 (sleep())을 제공하면서 makeSound()는 강제
- ✔️ Flyable은 **믹스인**으로 추가적인 “날기” 기능을 제공
- ✔️ Bird는 **인터페이스**로 “알을 낳는 기능”을 강제
- ✔️ Parrot(앵무새)는 **추상 클래스, 믹스인, 인터페이스를 모두 활용**하여 완성

**💡 결론**

| **사용법**         | **키워드**         | **용도**                                     |
| ------------------ | ------------------ | -------------------------------------------- |
| **Mixin**          | with               | 특정 기능 추가 (날기, 걷기 등)               |
| **Interface**      | implements         | 특정 규칙 강제 (모든 새는 알을 낳아야 함 등) |
| **Abstract Class** | abstract + extends | 공통 기능 제공 + 일부 구현 강제              |

- ✔ **공통 기능 제공**이 필요하면 **추상 클래스**
- ✔ **여러 기능을 조합**하고 싶다면 **믹스인**
- ✔ **일정한 규칙(강제 메서드)을 설정**하려면 **인터페이스**

