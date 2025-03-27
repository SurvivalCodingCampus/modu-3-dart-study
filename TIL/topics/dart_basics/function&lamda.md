1급 객체 = 변수에 대입 가능한 객체
EX) 값, 인스턴스, 함수

고계 함수 = 함수를 파라미터로 갖는 함수

map = 동일하게 출력할때
any = true or false
reduce = list요소를 활용해 하나의 값을 계산할때 좋음, ex) max값, min 값
함수형 코드 = 변수가 없기때문에 메모리를 거의 안잡아먹고 예외가 안생김, 하지만 보기가 읽기 어려움
forEach = 전체 순환하면서 뭔가 하고 끝 단 뭔가에 조건이 들어가면 안됨 조건이 있을땐 for문 안에 if로 돌리기
즉 if사용 불가
sorted = 사용하면 return을 받을수 있음 = 테스트코드 필요없음

```dart
//리스트 형식의 transaction 정의
final List<Transaction> transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

List<Transaction> sortedTransaction =
transactions.where((transactions) => transactions.year == 2011).toList()
  ..sort((a, b) => a.value.compareTo(b.value));

print(sortedTransaction);

List<String> cityName =
transactions
    .map((transactions) => transactions.trader.city)
    .toSet()
    .toList();

print(cityName);

int minTransaction = transactions
    .map((transactions) => transactions.value)
    .reduce(min);

print(minTransaction);

```

- where을 사용하면 조건을 줄 수 있음
- .toList를 통해 리스트 형식으로 만듬, 선언을 무조건 리스트 형식으로 선언해야함
- .toSet을 활용해 중복되는 값 제거
- .map을 활용해 transaction의 있는 내용들을 특정 값으로 바꿀 수 있음
- .toList를 쓰지 않았을 때는 변수 선언시 String이나 bool, int형 등을 잘 파악하고 넣기
- .reduce를 사용하면 값을 제거해 나갈 수 있어서 max나 min값 구할때 사용하기 좋음
