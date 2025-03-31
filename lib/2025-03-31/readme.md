# 과제1. 간단한 JSON 을 데이터 클래스로 변환

https://jsonplaceholder.typicode.com/todos/1

1. 위 링크에서 제공되는 Json 을 todo.json 으로 저장
2. todo.json 파일을 읽어서 Todo 객체로 변환하는 기능 작성
3. Todo, TodoDataSourceImpl 작성

```dart
abstract interface class TodoDataSource {
  Future<Todo> getTodo();
}
```

---

# 과제2. Json List 를 List<Todo> 로 변환

https://jsonplaceholder.typicode.com/todos

List<Todo> 추가

```dart
abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();
}
```

---

# 과제3. 복잡한 Json List 를 List 로 변환

https://jsonplaceholder.typicode.com/users

```dart
abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}
```

---

# 과제4. 주식 정보 데이터를 제공하는 데이터소스

https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo

CSV는 JSON 대비 Key 가 없고 내용만 있기 때문에 Json 대비 대략 절반의 메모리만 사용

```dart
abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}
```

- fromCsv(String csvRow) 형태의 factory 생성자를 작성할 것
- 단, 문제가 있는 항목(name 이 빈 항목)은 제외할 것