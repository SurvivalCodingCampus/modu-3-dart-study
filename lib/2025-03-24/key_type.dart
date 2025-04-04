enum KeyType {
  padlock,
  button,
  dial,
  finger;

  int get openCountLimit {
    switch (this) {
      case KeyType.padlock:
        return 1_024;
      case KeyType.button:
        return 10_000;
      case KeyType.dial:
        return 30_000;
      case KeyType.finger:
        return 1_000_000;
    }
  }
}
