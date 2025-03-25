String lo() {
  return 'lo';
}

void main() {
  String h =
      'h'
      'e'
      'l'
      'l'
      'o';

  print(h);

  String hello = 'Hello';
  String hel = 'Hel';

  // ignore: unnecessary_string_interpolations
  print(hello == '${hel + lo()}');
}
