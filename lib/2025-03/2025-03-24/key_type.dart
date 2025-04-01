enum KeyType {
  padLock(1024),
  button(10_000),
  dial(30_000),
  finger(1_000_000);

  final int maxCount;

  const KeyType(this.maxCount);
}
