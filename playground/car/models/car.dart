import '../enums/car_enums.dart';

abstract class Car {
  final CarBrand brand;
  final CarModel model;
  final int year;
  int price;
  final List<CarOption> options;

  Car({
    required this.brand,
    required this.model,
    required this.year,
    int? price,
    List<CarOption>? options,
  }) : options = options ?? [],
       price = price ?? model.initialPrice;
}
