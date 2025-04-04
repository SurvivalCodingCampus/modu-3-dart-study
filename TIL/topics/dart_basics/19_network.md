# 네트워크 통신

### 고수준 통신

- 사람이 이해하기 쉽게 작성된 프로그램 또는 API
- 저수준의 복잡한 구현 세부사항을 추상화하여 제공

### URI(통합 자원 식별자, Uniform Resource Identifier)

- 인터넷에 있는 자원을 나타내는 유일한 주소
- URL(Uniform Resource Locator)과 URN(Uniform Resource Name)을 포함하는 상위 개념

### HTTP(HyperText Transfer Protocol)

- 원래 문서 전송용으로 설계된 상태 비저장용 프로토콜
- 현재는 텍스트, 이미지, 동영상 등 다양한 데이터 교환에 사용
- 멀티파트 또는 Base64 인코딩으로 바이너리 데이터 전송
- JSON과 함께 RESTful API 구현에 활용
- HTTPS: HTTP + TLS(전송 계층 보안)
- 모든 HTTP 메시지는 요청과 응답이 일대일로 대응

### 무상태성(Stateless)

- HTTP는 상태 비저장 프로토콜
- 각 요청은 이전 요청과 독립적으로 처리
- 서버는 클라이언트 상태를 저장하지 않음
- 반대로 TCP는 Stateful 프로토콜

### HTTP 응답 타임아웃

- 서버 처리 완료 후에도 응답 지연으로 타임아웃 발생 가능
- Android: 10초 기본 타임아웃
- iOS: 60초 기본 타임아웃
- MockServer를 활용한 테스트 중요

### 네트워크 OSI-7 계층

- 네트워크 통신을 7개 계층으로 분류한 표준 모델
- 물리, 데이터 링크, 네트워크, 전송, 세션, 표현, 응용 계층으로 구성

### RFC(Request for Comments)

- 인터넷 기술에 대한 연구 결과, 절차, 제안 등을 담은 문서
- 인터넷 표준을 정의하는 공식 문서

### TCP vs UDP 비교

| **특성**     | **TCP**                                  | **UDP**                         |
| ------------ | ---------------------------------------- | ------------------------------- |
| 연결 방식    | 연결 지향적 (Connection-oriented)        | 비연결형 (Connectionless)       |
| 상태 관리    | Stateful 프로토콜                        | Stateless 프로토콜              |
| 신뢰성       | 높음 (데이터 손실 시 재전송)             | 낮음 (데이터 전달 보장 안됨)    |
| 속도         | 상대적으로 느림                          | 빠름                            |
| 오류 감지    | 한쪽에 문제 발생 시 다른쪽에서 감지 가능 | 제한적                          |
| 소켓 사용    | 요청들이 소켓 1개 공유                   | 각 메시지가 독립적              |
| 흐름 제어    | 있음                                     | 없음                            |
| 브로드캐스팅 | 지원 안 함                               | 멀티캐스팅 및 브로드캐스팅 지원 |
| 사용 사례    | 웹페이지, 이메일, 파일 전송              | 실시간 스트리밍, 게임, DNS      |
| 헤더 크기    | 20-60 바이트                             | 8 바이트                        |
| 타임아웃     | 직접 구현해야 함                         | 필요 없음                       |

### Socket을 사용한 저수준 액세스

- TCP/UDP를 추상화한 개발자를 위한 API
- 프로토콜이 아니므로 OSI 7계층에 포함되지 않음
- 네트워크 통신을 위한 엔드포인트 역할

### HTTP 요청 메서드

- **GET**: 리소스 조회, body 포함 불가
- **POST**: 리소스 생성, 데이터 처리, body로 데이터 전송
- **DELETE**: 리소스 삭제
- **PUT**: 리소스 전체 업데이트
- **PATCH**: 리소스 일부 업데이트

### HTTP 요청 헤더

- 인증, 캐싱, 클라이언트 힌트, 조건부 요청, 연결 관리, 쿠키, CORS 등에 활용
- Content-Type: 데이터 형식 지정 (application/json 등)
- Authorization: 인증 정보 전달

### 상태 코드

- **2xx**: 성공 (200 OK, 201 Created, 204 No Content 등)

- 4xx

  : 클라이언트 오류

  - 401(Unauthorized): 인증 필요
  - 403(Forbidden): 권한 없음
  - 404(Not Found): 리소스 없음

- **5xx**: 서버 오류

### 세션과 쿠키

- HTTP 무상태성을 보완하기 위한 상태 유지 메커니즘
- 서버: 세션으로 상태 저장, 클라이언트: 쿠키로 세션 ID 저장
- 모바일에서는 SharedPreference 등으로 유사 기능 구현

### RESTful API(Representational State Transfer)

- 서버와 클라이언트 간 통신을 위한 아키텍처 스타일
- 자원 중심 설계, 상태 없는 통신, 표준 HTTP 메서드 활용
- URI로 리소스 식별, HTTP 메서드로 동작 정의

[참고 링크](https://aws.amazon.com/ko/what-is/restful-api/)

### HTTP 통신을 위한 라이브러리

- **http**: 기본 HTTP 클라이언트 라이브러리

- Retrofit

  : REST API 호출을 위한 타입-세이프 클라이언트

  - 인터페이스 정의만으로 DataSourceImpl 자동 생성

