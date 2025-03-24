void main(List<String> args) {
  final now = DateTime.now();

  print(now.toString());
  print(now.toIso8601String());
  print(now.toUtc());

  DateTime birthDay = DateTime.parse('2025-03-24');
  print(birthDay);

  int a = 1;
  int b = a;
  b = 3;
  print(a);
  print(b);

  String greeting1 = 'Hello, World!';
  String greeting2 = greeting1;
  greeting2.toUpperCase();

  print(greeting1);
  print(greeting2);

  final hello = 'hello';
  const x = 'hel';
  const y = 'lo';
  final z = '$x$y';
  print(identical(hello, z));

    String aa = 'aa';
  String bb = aa;
  bb = 'bb';
  print(aa);
  print(bb);
}
