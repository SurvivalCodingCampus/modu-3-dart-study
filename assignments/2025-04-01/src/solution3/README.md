# 과제 설명

## Model Class, Repository 연습문제

### 연습문제 3

<br>

- Model Class Todo작성
    - 불변 객체, copyWith, ==, hashCode, toJson, fromJson 작성
- TodoDataSourceImpl, getTodos 작성
    - await로 파일 읽고, List<Map<String, dynamic>> 형태로 반환.
- TodoRepositoryImpl, getTodos, getCompletedTodos 작성
    - 생성자로 DataSource 가져오고, 직렬화 후 전체 반환.
    - 직렬화와 completed == true 검색 후 반환