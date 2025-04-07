# 과제 설명

## Result 패턴 과제

### 연습문제 1

- UserDto 작성
- User 모델 클래스 작성
- Mapper 작성.
    - null 처리 및 DateTime Parse 추가
- AuthRepositoryImpl에서 registerUser 작성
    - 에러 확인 로직을 checkEmailAndPassword 함수를 만들어서 처리
    - 정규식으로 영어+숫자 조합인지, @와 마침표가 있는지 확인
    - 패스워드 길이 6자리 이하인지 확인
    - Timeout으로 10초 안에 확인되지 않으면 네트워크 에러 처리
    - MockClient로 json 보내기 성공하면 MockClient에서 id와 createAt 추가
        - 잘못된 url 등 에러시 errorMessage 반환
    - fromJson, toUser 후 switch 문이나 테스트 코드에서 확인