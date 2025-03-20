abstract interface class Thing {
  double get weight;

  set weight(double value);


// 인터페이스 안에서 구현 금지
// {
//   if (value < 0) {
//     throw Exception('무게를 다시 측정하세요');
//   }
//   weight = value;
// }
}
