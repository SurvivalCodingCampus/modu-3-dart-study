//
import 'package:test/test.dart';

import '../../lib/car/carRecommend.dart';

void main() {
  test('CarRecommend Test', () {
    List<CarOption> userOption = [CarOption.Sunroof, CarOption.Tinting];

    final List<String> carMatcing = CarRecommend.findMatchCars(
      40000,
      2018,
      60000,
      userOption,
    );

    for (var result in carMatcing) {
      print(result);
    }
  });
}
