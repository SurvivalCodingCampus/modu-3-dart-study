void main(List<String> args) async {
  final int seconds = 3;

  // isTwitter = true;
  // // Future.wait([bird1(), bird2(), bird3()]);
  // Future.wait([bird('꾸우', 1), bird('까악', 2), bird('짹짹', 3)]);
  // await Future.delayed(Duration(seconds: seconds));
  // // await Future.delayed(Duration(seconds: seconds), () => print('$seconds초가 지났습니다.'),);
  // isTwitter = false;

  Future.doWhile(() async {
    isTwitter = true;
    Future.wait([bird('꾸우', 1), bird('까악', 2), bird('짹짹', 3)]);
    await Future.delayed(Duration(seconds: seconds));
    isTwitter = false;
    return isTwitter == true;
  });
}

bool isTwitter = true;

Future<void> bird1() async {
  while (isTwitter) {
    print('꾸우');
    await Future.delayed(Duration(seconds: 1));
  }
}

Future<void> bird2() async {
  while (isTwitter) {
    print('까악');
    await Future.delayed(Duration(seconds: 2));
  }
}

Future<void> bird3() async {
  while (isTwitter) {
    print('짹짹');
    await Future.delayed(Duration(seconds: 3));
  }
}

Future<void> bird(String message, int second) async {
  while (isTwitter) {
    print(message);
    await Future.delayed(Duration(seconds: second));
  }
}
