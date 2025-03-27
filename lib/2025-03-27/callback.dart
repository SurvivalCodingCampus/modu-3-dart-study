// 이 함수 안에서 비동기 코드로 순차적으로 실행 시킬 수 있다.
void main() async {
  print('start');
  fetchString().then((value) => print(value));
  print('end');

  // 비동기 코드가 실행이 되고 값도 Future 벗겨진 걸로 대입됨.
  String result = await fetchString();
}

Future<String> fetchString() {  // Futurn
  return Future.delayed(Duration(seconds: 1), () => '데이터');
}

void fetchData(void Function(String) onSuccess) {

  fetchWeather((e) => print(e));
  fetchUnse((e) => print(e));

  onSuccess('Hello');

}

void fetchWeather(void Function(String) onSuccess) {
  onSuccess('날씨정보 가져오는 중');

  //2초 걸림
  onSuccess('날씨정보 완료');
}

void fetchUnse(void Function(String) onSuccess) {
  // 1초 걸림
  onSuccess('가져오는 중');
}