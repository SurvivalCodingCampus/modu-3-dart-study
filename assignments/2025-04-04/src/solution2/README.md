# 과제 설명

## DTO, Mapper 연습문제

### 연습문제 2

<br>

- Photo 모델 클래스를 freezed로 작성.
    - enum Type도 선언
- Url의 모든 필드를 담을 수 있는 PhotoDto를 인공지능으로 작성
- PhotoMapper 작성
    - id를 int로 변환
    - type String 체크 후 enum Type으로 변환
    - createAt을 DateTime으로 parse
    - 그외 필드 null 처리
- DataSource에서 모든 정보 로딩 후 PhotoDto에 담음.
- Repository에서 DataSource의 PhotoDto들을 전부 Mapper toPhoto()를 이용하여 Photo로 변환
- MockPhotoDataSourceImpl 작성후 테스트