# 예외란?

<aside>

Exception은 인터페이스이다. → customException이 가능하다. toString 오버라이드 예외구체화

프로그램을 설계할 때

실행 시에 예외 상황이 발생 할 가능성이 있는 것을 예측하여, 사전에 예외 처리가 되도록 할 필요가 있음.

이럴 때 적절한 조치가 없으면 프로그램은 에러가 나며 죽어 버림.

예상 외의 상황에 적절한 조치를 취하는 것을 배운다.

</aside>

## 📍 예외의 종류와 대응책

1. 문법 에러 (syntax error)
2. 실행 시 에러 (runtime error)
3. 논리 에러 (logic error)

|  | syntax error | runtime error | logic error |
| --- | --- | --- | --- |
| 원인 | 코드의 형식적 오류 | 실행 중에 예상외의 사태가 발생하여 동작이 중지됨 | 기술한 처리 내용에 논리적인 오류가 있음 |
| 알아 채는 방법 | 컴파일하면 에러 남 | 실행하면 도중에 강제 종료 됨 | 실행하면 예상외의 값이 나옴 |
| 해결 방법 | 컴파일러의 지적을 보고 수정 | 에러 | 원인을 스스로 찾아서 해결해야 함 |

## 📍에외적 상황들

- 메모리 부족
- 파일을 찾을 수 없음
- 네트워크 통신 불가 등

## 📍예외 처리의 흐름

```dart
try{
// 에러가 날 것 같은 코드 
}catch(e){
//e 에러의 정보를 담고 있는 객체
}
```

## 📍예외를 발생 (던지기)

```dart
 throw FormatException('FormatException 이 발생했습니다.');
```

## 📍 try -catch 문으로 Exception 계열 예외를  처리

```dart
void main() {
  try {
    // 에러가 날 것 같은 코드
    someError();
  } catch (e) {
    //e 에러의 정보를 담고 있는 객체
    print(e);
  }
}

void someError() {
  // 강제 에러발생
  throw FormatException('FormatException 이 발생했습니다.');
}

```

## 📍 rethrow 로 에러 처리를 미룸

```dart
void main() {
  try {
    // 에러가 날 것 같은 코드
    someError2();
  } catch (e) {
    //e 에러의 정보를 담고 있는 객체
    print(e);
  }
}

void someError2() {
  try {
    someError();
  } catch (e) {
    rethrow;
  }
}

void someError() {
  // 강제 에러발생
  throw FormatException('FormatException 이 발생했습니다.');
}

```

## 📍 특정  예외를 처리

```dart
 try{
    someError2();
  }on FormatException {
    throw FormatException('FormatException 이 발생했습니다.');
  }catch(e){
    print(e);
  }
```

## 📍finally로 항상 해야하는 처리

```dart
  try{
    someError2();
  }on FormatException {
    throw FormatException('FormatException 이 발생했습니다.');
  }catch(e){
    print(e);
  }finally{
    print('에러가 있는 말든 실행');
  }
```

## 📢 결과

에러

- syntax error, runtime error, logic error 의 3종류
- 예외처리를 할 때는, runtime error를 대처한다

예외의 종류

- API에는 여러가지 예외적 상황을 표현하는 예외 클래스가 준비되어 있다.
- 예외 클래스를 상속하여 오리지날 예외 클래스를 정의할 수 있다.

예외 처리

- try-catch 문을 사용하면, try 블록 내에 예외가 발생했을 때 catch 블록에서 처리가 옮겨진다
- finally 블록으로 나중에 꼭 해야하는 처리를 할 수 있다
- throw 문을 사용하면 임의로 예외를 발생시킬 수 있다