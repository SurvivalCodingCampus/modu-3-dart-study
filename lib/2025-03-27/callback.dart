// async 이 함수 안에서 비동기 코드를 순차적으로 실행 시킬수 잇다
void main() async {
  // fetchData2('hello', (e) => print(e));

  print('시작');
  // String result;
  // fetchString('Future와 ', 1).then((value) => print(value));
  // result = await fetchString('async/awsit', 1);
  // print(result);

  await fetchData2('hello', (e) => print(e));
  // await 를 쓰려면 async 함수 안에서 사용 가능
  // await 는 Future 타입이 와야함
  // future와 async는 짝궁임

  print('끝');
}

// 함수 안에서 함수를 호출해서 콜하는것!
// 콜백 지옥이 발생할 가능성
void fetchData(void Function(String) onSuccess) {
  print('데이터가져오는 중');

  onSuccess('20%');
  onSuccess('60%');
  onSuccess('80%');
  onSuccess('100%');
}
// async / await

// Futrue 와 Then 사용
// 단점 : 실행 순서와 완료의 예측이 어려움
Future<String> fetchString(String value, int dely) {
  return Future.delayed(Duration(seconds: dely), () => value);
}

Future<void> fetchData2(String job, void Function(String) onSuccess) async {
  print('$job 데이터가져오는 중');

  await fetchWeather('날씨', (e) {
    print('날씨 $e');
  }).then((e) => print('날씨 완료'));

  await fetchUnse('운세', (e) {
    print('운세 $e');
  }).then((e) => print('운세 완료'));

  onSuccess('$job 완료');
}

Future<void> fetchWeather(String job, Function(String) onSuccess) async {
  print('$job 데이터가져오는 중');
  await Future.delayed(Duration(seconds: 2));
  print('$job 완료');
}

Future<void> fetchUnse(String job, Function(String) onSuccess) async {
  print('$job 데이터가져오는 중');
  await Future.delayed(Duration(seconds: 3));
  print('$job 완료');
}
