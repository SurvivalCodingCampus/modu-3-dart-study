# 과제 설명

## 연습문제 1️⃣

<aside>
🔎

### 문제

현실세계의 성직자 “클레릭" 를 표현하는 클래스 Cleric 를 작성 하시오.

성직자는 용사 처럼 이름과 HP를 가지고 있고, 추가로 마법을 사용하기 위한 MP를 가지고 있다.

Cleric 클래스에 “이름", “HP”, “최대 HP”, “MP”, “최대 MP”를 속성으로 추가 하시오.

또한 HP와 최대 HP는 정수로 초기치 50, MP와 최대 MP는 정수로 초기치 10으로 하고,

최대 HP와 최대 MP는 상수 필드로 선언 하시오

</aside>

<aside>
📝

### 문제 해석하기

1. `Cleric` 클래스 만들기 
2. `Cleric` 클래스 필드(속성) 추가하기
    1. `name` (이름)
    2. `hp` (HP) - 50으로 초기화
    3. `maxHp` (최대 HP) - 상수, 50으로 초기화
    4. `mp` (MP)- 10 초기화
    5. `maxMp` (최대 MP)  - 상수, 10으로 초기화
3. `Cleric` 클래스 생성자 추가하기 
    
    ✚ 추가 ) 인스턴스가 생성될때 소개하는 출력 구문 만들기 
    
</aside>

<aside>
🖥️

### 결과 화면

![설명](https://github.com/complete0415Jiyoung/modu-3-dart-study/blob/master/assets/image/homework/image.png?raw=true)

</aside>

## 연습문제 2️⃣

<aside>
🔎

### 문제

성직자는 “셀프 에이드" 라는 마법을 사용할 수 있고, MP를 5소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다.

연습 1 에 선언한 Cleric 클래스에 “selfAid()” 메소드를 추가 하시오.

또한, 이 메소드는 인수가 없고, 리턴 값도 없다.

</aside>

<aside>
📝

### 문제 해석하기

1. `Cleric` 클래스에 **`selfAid()`** 메소드를 추가하기
2. **`selfAid()`** 메소드 동작 구현하기 
    1. mp를 5소비 
    2. 자신의 hp를 최대 maxHp 까지 회복
    3. 인수 없고 리턴 값 없음
</aside>

<aside>
🖥️

### 결과 화면

![설명](https://github.com/complete0415Jiyoung/modu-3-dart-study/blob/master/assets/image/homework/image2.png?raw=true)

</aside>

## 연습문제 3️⃣

<aside>
🔎

### 문제

성직자는 “기도하기" (pray) 라는 행동을 취할 수 있고, 자신의 MP를 회복한다.

회복량은 기도한 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한 양이다 (3초 기도하면 회복량은 3 ~ 5 포인트). 단, 최대 MP 보다 더 회복하는 것은 불가능 하다.

연습 2에서 선언한 Cleric 클래스에 “pray()” 메소드를 추가하시오.

이 메소드는 인수에 “기도할 시간(초)"를 지정할 수 있고, 리턴 값은 “실제로 회복된 MP 양" 을 반환한다.

</aside>

<aside>
📝

### 문제 해석하기

1. `Cleric` 클래스에를 추가하기
2. `pray()` 메소드 동작 구현하기
    1. 기도한 시간에 따라 회복량은 **0 ~ 2포인트**의 랜덤 보정이 추가
    2. 예를 들어, 3초 기도하면 회복량은 **3 ~ 5포인트**
3. 최대 MP 제한
4. 실제로 회복된 MP 반환
</aside>

<aside>
🖥️

### 결과 화면

![설명](https://github.com/complete0415Jiyoung/modu-3-dart-study/blob/master/assets/image/homework/image3.png?raw=true)

</aside>

