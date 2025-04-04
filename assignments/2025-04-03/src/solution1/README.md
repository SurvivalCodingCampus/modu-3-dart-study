# 과제 설명

## 네트워크 통신 연습문제

### 연습문제 1

<br>

- Json Serializable로 모델 클래스 Movie 작성
    - @JsonKey를 이용해서 releaseDate에만 옵션 추가
- http.client와 url을 받아오는 MovieDataSourceImpl 작성
    - 가져온 데이터중 json\[’results’\]로 필요한 부분만 추출하고, map으로 사용할 항목만 남김.
    - 한글 표시를 위해 jsonDecode시에 utf8.decode 추가
- MovieRepositoryImpl 추가
    - 데이터 가져와서 역직렬화 하는 getMovieInfoList 작성
- MockClient 작성
    - Response 데이터를 적고 마찬가지로 한글을 위한 utf8.encode 추가