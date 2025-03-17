
//
import 'package:modu_3_dart_study/car/carRecommend.dart';
import 'package:test/test.dart';

void main() {
  test('CarRecommend Test', () {


    List<CarOption> userOption = [
      CarOption.Sunroof,
      CarOption.Tinting,
    ];

    final List<String> carMatcing = CarRecommend.findMatchCars(40000, 2018, 60000, userOption);

    for (var result in carMatcing) {
      print(result);
      print("---------------------");
    }

  });



}