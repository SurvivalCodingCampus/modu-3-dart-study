# 과제 설명

## Model Class, Repository 연습문

### 연습문제 4

<br>

- Model Class User, Geo, Address, Company 작성
    - 전부 각각 불변 객체, copyWith, ==, hashCode, toJson, fromJson 작성
- UserDataSourceImpl, getUsers 작성
    - await로 파일 읽고, List<Map<String, dynamic>> 형태로 반환.
- UserRepositoryImpl, getUsers, getUsersTop10ByUserName 작성
    - 생성자로 DataSource 가져오고, 직렬화 후 전체 반환.
    - 직렬화 후 username 순으로 sorted 후 take(10)으로 10개만 가져온 후 반환