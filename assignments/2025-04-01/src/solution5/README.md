# 과제 설명

## Model Class, Repository 연습문제

### 연습문제 5

<br>

- Model Class Album작성
    - 불변 객체, copyWith, ==, hashCode, toJson, fromJson 작성
- AlbumDataSourceImpl, getAlbums 작성
    - readAsStringSync로 파일 읽고, List<Map<String, dynamic>> 형태로 반환.
- AlbumRepositoryImpl, getAlbums 작성
    - 동기 코드로 작성
    - 생성자로 DataSource 가져오고, 직렬화.
    - take에서 limit이 null이면 전체 앨범 길이만큼 적용