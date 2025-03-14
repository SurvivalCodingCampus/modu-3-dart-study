## 연습문제 1️⃣

<aside>
🔎

### 문제

현시점의 Cleric 클래스의 정의에는, 각 인스턴스별로 최대 HP와 최대 MP 필드에 대한 정보를 가지고 있다. 하지만, 모든 성직자의 최대 HP 는 50, 최대 MP 는 10으로 정해져 있어, 각 인스턴스가 각각의 정보를 가지는 것은 메모리 낭비이다.

그래서, 최대 HP, 최대 MP의 필드가 공유 되도록 필드 선언에 적절한 키워드를 추가하시오

</aside>

<aside>
📝

### 문제 해석하기

- 최대 HP와 최대 MP는 **모든 Cleric 인스턴스가 공유**해야 하므로 `static`을 사용
- 최대 HP와 최대 MP 값이 변하지 않도록 상수 설정
    - → final 쓰면 오류남! 잘 생각해 보기
</aside>

## 연습문제 2️⃣

<aside>
🔎

### 문제

아래의 방침에 따라, 생성자를 추가 하시오

1. 이 클래스는 Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
2. 이 클래스는 Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다. 이 때, MP는 최대 MP와 같은 값이 초기화 된다
3. 이 클래스는 Cleric(“아서스") 와 같이 이름만을 지정하여 인스턴스화 할 수 있다. 이 때, HP 와 MP 는 최대 HP와 최대 MP로 초기화 된다
4. 이 클래스는 Cleric() 과 같이 이름을 지정하지 않는 경우에는 인스턴스화 할 수 없다고 한다. (이름이 없는 성직자는 존재 할 수 없음)
5. 생성자는 가능한 한 중복되는 코드가 없도록 작성한다
</aside>

<aside>
📝

### 문제 해석하기

- **기본 생성자 수정하기**
- **네임드 파라미터로만 활용**
- **`maxHp`와 `maxMp` 가 초기화 되는 시점 잘 생각하기**
</aside>

## 😱  오류 내용!

### 📍 `final` 로 실행 하면 오류가 나요,,!

![설명](https://github.com/complete0415Jiyoung/modu-3-dart-study/blob/master/assets/image/homework/image5.png?raw=true)

### 📍 `const` 로 실행하면 안난다!!

![설명](https://github.com/complete0415Jiyoung/modu-3-dart-study/blob/master/assets/image/homework/image6.png?raw=true)

<aside>
💡

### 🤦‍♀️ 왜 똑같은 상수인데  이런 문제가 발생할까?

사실, `final`과  `const`는 비슷한 개념 같지만 **완전히 다른 동작 방식을 가진다!**

- `final`은 **런타임**에 값이 할당, 즉, 프로그램 실행 중에 한 번만 값을 설정할 수 있지만, 그 값은 **실행할 때까지 결정되지 않는다!**
- `const`는 **컴파일 시점**에서 값을 **이미 결정,** 프로그램이 실행되기 전에, 컴파일 단계에서 값이 확정되고 메모리에 할당된다!

### 결론

따라서 인스턴스화 될때 `final`로 하면 코드가 실행되지 않은 상태라 `maxHp`??? `maxMp`?? 너네 누군데 이러면서 오류남~

`const`로 하면 이미 `maxHp`와 `maxMp` 가 초기화 할당이 되어있어서 문제 없이 실행이 된다!

</aside>

<aside>
🖥️

### 결과 화면

성직자 캐릭터 무사히 성공

![설명](https://github.com/complete0415Jiyoung/modu-3-dart-study/blob/master/assets/image/homework/image4.png?raw=true)

</aside>