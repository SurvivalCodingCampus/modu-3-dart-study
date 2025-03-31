import 'package:modu_3_dart_study/PR2025-03-19/tangibleAsset.dart';

void printNumber(List<int> a) {
  print(a);
}

void main() {
  // Pocket pocket = Pocket();
  // pocket.put(1);
  // final data = pocket.get();
  // //만약 put에 문자를 넣으면 터져버림
  // print((data as int)+1);
  // Pocket<int> pocket = Pocket();
  // pocket.put(1);
  Pocket<TangibleAsset> pocket = Pocket();
  //pocket.put();
  final data = pocket.get();
  //만약 put에 문자를 넣으면 터져버림
  List<int> number = [];
  number.add(5);
  print(number);
  print(data);

  List<String> names = [];
  names.addAll(['현수', '미수', '미자']);
  print(names);
}

class Pocket<E extends TangibleAsset> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  E? get() {
    return _data;
  }
}

//ver1
// class Pocket {
//   Object? _data;
//   void put(Object data){
//     _data = data;
//
//   }
//   Object? get(){
//     return _data;
//   }
// }
