

# 열거형(enum)

- 정해둔 값만 넣어둘 수 있는 타입
- class처럼 함수도 만들고 constructor도 만들 수 있다. [문서](https://dart.dev/language/enums#declaring-enhanced-enums)

### 향상된 enum(Enhanced enums)

```dart
enum Status {
  todo(0, '할 일'),
  inProgress(1, '진행 중'),
  done(2, '완료');

  final int code;
  final String displayName;

  const Status(this.code, this.displayName);
}
```

###  enum 확장하기 (implements 사용)

```dart
abstract class Colorful {
  String get hexCode;
  void display();
}

enum Theme implements Colorful {
  light,
  dark;
  
  @override
  String get hexCode {
    switch (this) {
      case Theme.light:
        return '#FFFFFF';
      case Theme.dark:
        return '#000000';
    }
  }
  
  @override
  void display() {
    print('테마: $name, 색상 코드: $hexCode');
  }
}

void main() {
  final currentTheme = Theme.dark;
  currentTheme.display(); // 테마: dark, 색상 코드: #000000 출력
}
```



