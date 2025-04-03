# 과제 설명

## 네트워크 통신 연습문제

### 연습문제 2

<br>

- http.client를 받아올 수 있는 ImageDataSourceImpl 작성
    - mock 데이터를 쓰기 위해서 이렇게 만듦.
- Uint8List를 가져오는 fetchImage생성.
    - get 이후 responce.bodyBytes로 Uint8List를 return함
- path위치에 writeAsBytes를 이용해서 이미지를 저장하는 saveImage 생성
- ImageRepositoryImpl에서는 url 하나만을 이용한 saveImage와 urls.length만큼 이미지를 저장하는 saveImages 생성