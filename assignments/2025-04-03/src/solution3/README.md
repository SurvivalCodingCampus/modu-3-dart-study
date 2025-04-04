# 과제 설명

## 네트워크 통신 연습문제

### 연습문제 3

<br>

- Json Serializable로 모델 클래스 Todo 작성.
- where로 id 일치하는 하나만 가져오는 getTodo와 전부 가져오는 getTodos 작성.
    - 한글 표시를 위해 jsonDecode시에 utf8.decode 추가
- TodoRepositoryImpl 작성
- MockClient를 제공하는 createTodoMockClient 작성.
    - 한글 깨짐 방지를 위해 jsonEncode 사용