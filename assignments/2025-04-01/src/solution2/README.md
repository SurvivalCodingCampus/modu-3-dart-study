# 과제 설명

## Model Class, Repository 연습문제

### 연습문제 2

<br>

- Model Class Photo작성
    - 불변 객체, copyWith, ==, hashCode, toJson, fromJson 작성
- PhotoDataSourceImpl, getPhotos 작성
    - await로 파일 읽고, List<Map<String, dynamic>> 형태로 반환.
- PhotoRepositoryImpl, getPhotos 작성
    - 생성자로 DataSource 가져오고, 직렬화와 albumId검색 후 반환.