void main() {
  final str1 = 'Hello';
  final str2 = 'Hello';

  const str4 = 'Hel';
  const str5 = 'lo';

  print(identical(str1, str2));

  const str3 = '$str4$str5';

  print(identical(str3, str1));
}
