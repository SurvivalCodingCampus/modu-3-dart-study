enum KeyType {
  padlock(tries: 1024),
  button(tries: 10000),
  dial(tries: 30000),
  finger(tries: 1000000);

  const KeyType({required this.tries});

  final int tries;
}
