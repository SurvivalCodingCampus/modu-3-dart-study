

## DataSource

- 앱이 사용하는 원천 데이터를 가져오는 통로
  - 마치 재료를 준비하는 프랩 과정
  - 다양한 형태: 파일, 텍스트, JSON, DB
- Raw 데이터 수신 및 처리
- CRUD 작업 수행
- 구현체가 하나뿐이라면 Impl 접미사를 붙이는게 관례
- csv는 JSON 대비 Key가 없고 내용만 있기 때문에 JSON 대비 대략 절반의 메모리만 사용





## Model Class, Repository 개념

- 데이터를 조회할 수 있는 클래스
- 별도의 기능을 가지지 않는 순수한 클래스로 작성
- 데이터 소스를 필요한 형태로 변환한 데이터, 앱개발을 편리하게 해주는 역할



###  비슷한 용어들

- 도메인 모델: 비즈니스 문제 영역의 개념과 규칙을 코드로 표현한 객체 모델
- Entity: 고유한 식별자(ID)를 가지며 생명주기동안 지속적으로 변경될 수 있는 도메인
- DTO: 계층간 데이터 전송을 위해 설계된 단순한 데이터 컨테이너
- POJO: 특정 프레임워크나 규약에 종속되지 않은 순수한 자바 객체
- VO: 값 자체가 의미를 갖는 불변의 객체로, 속성값이 같으면 동일한 객체로 취급
- 데이터 클래스(4종세트 포함)
  - hashCode, toString(), copyWith(), ==(equals)



### DDD(Domain Driven Design)

- 유사한 업무의 집합
- 특정 상황(주문, 결재, 로그인)이나 특정 객체(유저, 손님)가 중심이 될 수 있음
- 모델 클래스
  - 도메인을 클래스로 작성한 것



### 알쏭달쏭 const constructor

```dart
void main() {
  final user = User('name', 10);
  final user2 = User('name', 10);
  
  print(identical(user, user2)); // false: const로 생성하려면 User 앞에다가 const를 붙여야 한다.
}

class User {
  final String name;
  final int age;
  
  const User(this.name, this.age);
}
```





## Repository 패턴

- 데이터 접근에 대한 추상화 계층
- 데이터 소스 은닉
- 데이터 매핑과 변환 담당
- 데이터 소스(DB, Fild 등)와의 통신을 담당하는 객체를 캡슐화하는 디자인 패턴
- 도메인 의도가 명확히 드러남



#### 주의할 점

- Repository는 비즈니스 로직에 집중
- 복잡한 비즈니스 로직은 더 상위 계층으로
- 성능을 고려한 쿼리 설계 필요





# 
