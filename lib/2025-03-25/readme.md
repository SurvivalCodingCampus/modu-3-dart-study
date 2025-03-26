# 예외 (Exception)
## 연습문제 1
다음과 같은 코드를 작성, 실행 후 runtime error 를 발생하시오

```dart
final numString ='10.5';

int num =int.parse(numString);

print(num);
```

## 연습문제 2
연습 1 에서 작성한 코드를 수정하여, try-catch() 문을 사용하여 예외처리를 하시오. 예외처리에는 다음의 처리를 수행하시오.
예외가 발생하면 0으로 처리


# 파일 조작
## 연습문제 1 -  파일 복사 클래스 작성
파일을 복사하는 DefaultFileOperations 클래스를 작성하시오
```dart
abstract interface class FileOperations {
// / 지정된 경로의 파일을 다른 경로로 복사합니다.
  ///
  /// [sourcePath] 복사할 원본 파일의 경로
  /// [targetPath] 파일이 복사될 대상 경로

  /// Throws [ArgumentError] 대상 경로가 유효하지 않은 경우
  void copy(String sourcePath, String targetPath);
}
```
원본 파일 경로와 복사할 파일 경로는 프로그램 실행시 파라미터로 전달되는 것으로 하고, 버퍼링이나 에러 처리는 안 해도 된다.


# 여러가지 데이터 형식
다음과 같은 사원 클래스와 부서 클래스가 있습니다.

```dart
class Employee {
	String name;
	int age;

	Employee(this.name, this.age);
}

class Department {
	String name;
	Employee leader;

	Department(this.name, this.leader);
}
```
총무부 리더 ‘홍길동(41세)’의 인스턴스를 생성하고 직렬화하여 company.txt 파일에 저장하는 프로그램을 작성하시오.
직렬화를 위해 위의 2개 클래스를 일부 수정하시오.
(배운 내용으로 역직렬화 진행)

