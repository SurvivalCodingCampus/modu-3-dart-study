# 과제 설명

## Model Class, Repository 연습문제

### 연습문제 1

<br>

- Model Class Comment 작성
    - 불변 객체, copyWith, ==, hashCode, toJson, fromJson 작성
- CommentDataSourceImpl, getComments 작성
    - await로 파일 읽고, List<Map<String, dynamic>> 형태로 반환.
- CommentRepositoryImpl, getComments 작성
    - 생성자로 DataSource 가져오고, 직렬화와 postId 검색 후 반환.

<br>