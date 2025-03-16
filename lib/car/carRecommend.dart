enum CarBrand{
  Hyundai,
  Toyota,
  Honda,
  BMW,
  Mercedes,
  Ford,
  Chevrolet,
  Tesla,
  Nissan,
  Kia
}

enum CarOption{
  Navigation,
  Sunroof,
  LeatherSeats,
  BackupCamera,
  HeatedSeats,
  Bluetooth,
  AndroidAuto,
  AllWheelDrive
}

extension CarOptionPrice on CarOption {
  int get price {
    return switch (this) {
      CarOption.Navigation => 200000,
      CarOption.Sunroof => 150000,
      CarOption.LeatherSeats => 250000,
      CarOption.BackupCamera => 100000,
      CarOption.HeatedSeats => 120000,
      CarOption.Bluetooth => 80000,
      CarOption.AndroidAuto => 90000,
      CarOption.AllWheelDrive => 300000
    };
  }
}


class CarRecommend {


  final CarBrand brand;
  final String model;
  final int year;
  int price;
  final int mileage;
  final List<CarOption> options;


  CarRecommend({
    required this.brand,
    required this.model,
    required this.year,
    required this.price,
    required this.mileage,
    List<CarOption>? options
  }) : options = options ?? [];



  static final List<CarRecommend> carDatabase = [
    CarRecommend(brand: CarBrand.Hyundai, model: "Sonata", year: 2018, price: 20000, mileage: 50000, options: [CarOption.Navigation]),
    CarRecommend(brand: CarBrand.Toyota, model: "Camry", year: 2020, price: 25000, mileage: 30000, options: [CarOption.Sunroof]),
    CarRecommend(brand: CarBrand.Honda, model: "Civic", year: 2017, price: 18000, mileage: 60000, options: [CarOption.LeatherSeats]),
    CarRecommend(brand: CarBrand.BMW, model: "X5", year: 2021, price: 45000, mileage: 25000, options: [CarOption.BackupCamera, CarOption.Sunroof]),
    CarRecommend(brand: CarBrand.Mercedes, model: "C-Class", year: 2019, price: 40000, mileage: 35000, options: []),
    CarRecommend(brand: CarBrand.Ford, model: "Mustang", year: 2016, price: 28000, mileage: 70000, options: [CarOption.Sunroof]),
    CarRecommend(brand: CarBrand.Chevrolet, model: "Malibu", year: 2022, price: 27000, mileage: 15000, options: []),
    CarRecommend(brand: CarBrand.Tesla, model: "Model 3", year: 2023, price: 50000, mileage: 10000, options: [CarOption.AllWheelDrive, CarOption.HeatedSeats]),
    CarRecommend(brand: CarBrand.Nissan, model: "Altima", year: 2015, price: 15000, mileage: 90000, options: [CarOption.Navigation, CarOption.Sunroof]),
    CarRecommend(brand: CarBrand.Kia, model: "Sportage", year: 2020, price: 23000, mileage: 40000, options: []),
  ];


  static List<String> findMatchCars(int maxPrice, int minYear, int maxMileage, [List<CarOption>? options]) {
    return carDatabase.where((car) {
      return car.price <= maxPrice &&
             car.year >= minYear &&
             car.mileage <= maxMileage &&
             (options == null || options.isEmpty || options.every(car.options.contains));
    }).map((car) {
      return "${car.brand} ${car.model} (${car.year}) - ${car.options.isNotEmpty ? '옵션이 있습니다' : '옵션이 없습니다'}";
    }).toList();
  }

  // static List<String> chooseOptionForCar(){
  //
  // }





}
