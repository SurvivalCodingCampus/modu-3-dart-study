## 함수 (Functions)

### 옵셔널 파라미터

1. #### 위치 지정 옵션 파라미터

   함수 호출 시 생략할 수 있으며, 생략된 파라미터는 기본값으로 초기화

   

   ```dart
   void greet(String name, [String greeting = 'Hello']) {
     print('$greeting, $name!');
   }
   
   void main() {
     greet('Alice');           // 출력: Hello, Alice!
     greet('Bob', 'Hi');       // 출력: Hi, Bob!
   }
   ```

   #### 2. 이름 지정 옵션 파라미터

2. 이름 지정 옵션 파라미터는 중괄호({})로 감싸서 정의합니다. 함수 호출 시 생략할 수 있으며, 생략된 파라미터는 기본값으로 초기화됩니다. 이름을 지정하여 호출하므로 순서에 의존하지 않습니다.

   dart

   ```dart
   void greet(String name, {String greeting = 'Hello', int age = 0}) {
     print('$greeting, $name! You are $age years old.');
   }
   
   void main() {
     greet('Alice');                             // 출력: Hello, Alice! You are 0 years old.
     greet('Bob', greeting: 'Hi', age: 25);      // 출력: Hi, Bob! You are 25 years old.
     greet('Charlie', age: 30);                  // 출력: Hello, Charlie! You are 30 years old.
   }
   ```

