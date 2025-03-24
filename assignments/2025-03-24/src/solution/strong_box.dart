// ignore_for_file: public_member_api_docs, sort_constructors_first
class StrongBox<E> {
  KeyType key;
  E? _data;
  int _count = 0;

  StrongBox({required this.key});

  void put(E data) {
    _data = data;
  }

  E? get() {
    _count++;
    if (_count < key.maxCount) {
      return null;
    }

    return _data;
  }
}

enum KeyType {
  padLock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int maxCount; // 각 enum 값에 대한 필드 추가

  const KeyType(this.maxCount); // 생성자 정의
}

void main() {
  final strongBox = StrongBox(key: KeyType.button);

  strongBox.put('100만원');

  for (int i = 0; i < 10000; i++) {
    print(strongBox.get());
  }
}
