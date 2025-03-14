### const

- 상수 선언 키워드
- **컴파일 시점에 값 결정**
- 인스턴스 변수(ex String name)에 단독 사용 불가,
- static 키워드와 함께 사용 가능
- const String name = '현수' 즉 컴파일시 값이 정해진 상수에서는 쓸 수 있음
- 값 변경 xx

### final

- 상수 선언 키워드
- **런타임(실행) 시점에 값 결정**
- 최초 한번 값이 할당되면 더이상 값 할당 xx
- DateTime.now()사용 가능

const int height = 10; //가능
const int weight; //불가능, 컴파일시 초기화가 되어있어야함
height = 30; //불가능, const로 선언한 상수는 재할당이 안됨

final int height; //가능
height = 20; //가능, 선언만 해주고 초기화는 아직 안했기 때문에
height = 30; //불가능, final로 선언한 상수는 재할당이 안됨
final int weight = 50; //가능
weight = 70; //불가능, final로 선언한 상수는 재할당이 안됨