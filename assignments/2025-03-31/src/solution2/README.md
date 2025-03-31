# 과제 설명

## DataSource 연습문제

### 과제 2번

<br>

- TodoDataSource 인터페이스에 getTodos 생성
- TodoDataSourceImpl에 getTodos 오버라이브
- List<dynamic>으로 받은 후 map으로 리스트의 각 요소를 역직렬화

<br>

### 과제 2번 궁금증

<br>

```
final String fileString = file.readAsStringSync();
final List<dynamic> jsonList  = jsonDecode(fileString); // 다이나믹으로 밖에 안받아짐.
// final List<Map<String, dynamic>> jsonList = jsonDecode(fileString); // 이게 안됨???
// List의 dynamic을 명시적으로 바꾸진 않았음.

final List<Todo> todos = jsonList.map((e) => Todo.fromJson(e)).toList();
```

<br>

- jsonDecode하면 일단 무조건 다이나믹 형태로 리턴
    - List 타입인 것 까지는 인식이 된 것.

- 내부에 있는 요소까지 디코딩은 된 것이고 형태는 내부 타입추론 까지는 안되어서 dynamic으로 해야하는 것
    - 디버그 모드로 직접 찍어보면 타입은 dynamic이나 내부은 전부 map으로 명시되어 있는 것을 볼 수 있음.
- 굳이 명시적으로 하려면 for이나 forEach 쓰면 되는데, 위 예시가 보편적으로 쓰이기 때문에 굳이 그럴 필요는 없을듯.