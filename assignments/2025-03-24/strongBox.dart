import 'keyType.dart';

class StrongBox<T> {
  KeyType _keyType;

  //아이템
  T? _data;

  int _count = 0;

  StrongBox({required keyType}): _keyType = keyType;

  void put(T data) {
    _data = data;
  }

  T? get() {
    if (_count < _keyType.maxCount) {
      _count++;
      print("사용횟수: $_count");
      return null;
    } else {
      print("사용횟수: $_count, 데이터: $_data");
      return _data;
    }
  }

  get count => _count;
  get data => _data;
}