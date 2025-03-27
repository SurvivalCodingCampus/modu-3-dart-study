

# Collection



### sortedBy

- `List.sort()`가 원본 리스트를 직접 변경하는 반면, `sorted()`는 원본을 유지

### sortedBy<T>()

- Iterable 확장 메소드로, 특정 키 기준으로 정렬

### sortedByCompare<T, K>()

- 키 함수와 비교 함수를 모두 지정

```dart
import 'package:collection/collection.dart';

void main() {
 var numbers = [5, 3, 1, 4, 2];
 var people = [
   {'name': 'Kim', 'age': 30},
   {'name': 'Lee', 'age': 25},
   {'name': 'Park', 'age': 40}
 ];
 
 // 1. sort() - 원본 리스트를 직접 변경
 var list1 = [...numbers];
 list1.sort();
 print(list1); // [1, 2, 3, 4, 5]
 
 // 2. sorted() - 원본을 변경하지 않고 정렬된 새 리스트 반환
 var list2 = numbers.sorted();
 print(numbers); // [5, 3, 1, 4, 2] - 원본 유지
 print(list2);   // [1, 2, 3, 4, 5] - 정렬된 새 리스트
 
 // 3. sortedBy() - 특정 키 속성으로 정렬된 새 리스트 반환
 var list3 = people.sortedBy((person) => person['age']);
 // 결과: [{'name': 'Lee', 'age': 25}, {'name': 'Kim', 'age': 30}, {'name': 'Park', 'age': 40}]
 print(list3);
}
```





### compareNatural<T>()

- 문자열의 자연스러운 정렬을 위한 비교 함수
- 숫자가 포함된 문자열을 정렬할 때 숫자 부분을 숫자로 인식하여 정렬

```dart
import 'dart:collection';

var files = ['file10', 'file1', 'file2'];
files.sort(compareNatural);
print(files); // [file1, file2, file10]
```





### iterable 메서드 중 lazy evaluation(지연 평가)

- 지연 평가란 비용이 많이 드는 초기화 프로세스를 필요로 하는 객체를 캐시하고 지연 평가하는 간단한 패키지
- ⭐️lazy evaluation(지연 평가)이므로 즉시 실행되지 않는다

```dart
transactions.where((e) => e.year == 2011).toList()
    ..sort((p, e) => p.value.compareTo(e.value))
    ..map((e) => e.trader.name)
    .toList() // <--- toList()를 추가하여 리스트 변환
    .forEach(print);
```

