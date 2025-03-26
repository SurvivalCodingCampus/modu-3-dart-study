## 제어 흐름 (Control Flow)

### 루프 (Loops)



### for문 무한루프

```dart
for(;;) {
	print('Hello World');
}
// 무한루프
```



### Label(레이블) - 특정 루프 이름 지정

```dart
outerLoop: // 레이블 이름 지정
for (final word in words) {
  int left = 0;
  int right = word.length - 1;
  while (left <= right) {
    if (word[left] != word[right]) {
      break outerLoop; // for 루프를 종료
    }
    left++;
    right--;
  }
}
```



### for문에서 조건 주의점

이 경우 5만 건너뛰는게 아니라 **조건에 안맞으면** 루프 종료

```dart
for (int i = 0; i < 100 && i != 5; i++) {
  print(i);
}
```





### for문의 또다른 사용법

변수 선언쪽에 여러 변수를 선언할 수 있다.

```dart
for (int i = 0, j = s.length - 1; i < j; i++, j--) {
  var temp = s[i];
  s[i] = s[j];
  s[j] = temp;
}
```



### Switch Case 활용

```dart
double depreAndAmort() {
    final currentDate = DateTime.now();
    final differentDays = currentDate.difference(createdDate).inDays;

    switch (differentDays) {
      case <= 30:
        return price * 0.8;
      case < 90:
        return price * 0.7;
      default:
        return price * 0.5;
    }
  }
```

[여러문법 확인해보기](https://github.com/dart-lang/language/issues/1660)

