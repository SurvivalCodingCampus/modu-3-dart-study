void main(List<String> args) {
  // Future.wait([bird1(), bird2(), bird3()]);
  Future.wait([bird('꾸우', 1), bird('까악', 2), bird('짹짹', 3)]);
}

int numberOfTwitter = 4;

Future<void> bird1() async {
  for (int i = 0; i < numberOfTwitter; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('꾸우');
  }
}

Future<void> bird2() async {
  for (int i = 0; i < numberOfTwitter; i++) {
    await Future.delayed(Duration(seconds: 2));
    print('까악');
  }
}

Future<void> bird3() async {
  for (int i = 0; i < numberOfTwitter; i++) {
    await Future.delayed(Duration(seconds: 3));
    print('짹짹');
  }
}

Future<void> bird(String message, int second) async {
  for (int i = 0; i < numberOfTwitter; i++) {
    print(message);
    await Future.delayed(Duration(seconds: second));
  }
}
