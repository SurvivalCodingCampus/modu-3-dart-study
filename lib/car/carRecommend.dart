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
  AllWheelDrive,
  Tinting
}

// enum 옵션 추가
extension CarOptionPrice on CarOption {
  // 옵션 추가 가격
  int get price => switch (this) {
    CarOption.Navigation => 200000,
    CarOption.Sunroof => 0,
    CarOption.LeatherSeats => 0,
    CarOption.BackupCamera => 100000,
    CarOption.HeatedSeats => 120000,
    CarOption.Bluetooth => 80000,
    CarOption.AndroidAuto => 90000,
    CarOption.AllWheelDrive => 0,
    CarOption.Tinting => 180000,
  };

  //추가 가능한 옵션
  bool get canBeAdded => switch (this) {
    CarOption.Sunroof => false,
    CarOption.LeatherSeats => false,
    CarOption.AllWheelDrive => false,
    _ => true
  };
}


class CarRecommend {

  //필드
  final CarBrand brand;
  final String model;
  final int year;
  int price;
  final int mileage;
  final List<CarOption> options;

  //생성자
  CarRecommend({
    required this.brand,
    required this.model,
    required this.year,
    required this.price,
    required this.mileage,
    List<CarOption>? options
  }) : options = options ?? [];


  // 차량 데이터 베이스
  static final List<CarRecommend> carDatabase = [
    CarRecommend(brand: CarBrand.Hyundai, model: "Sonata", year: 2018, price: 2000000, mileage: 50000, options: [CarOption.Navigation]),
    CarRecommend(brand: CarBrand.Toyota, model: "Camry", year: 2020, price: 2500000, mileage: 30000, options: [CarOption.Sunroof]),
    CarRecommend(brand: CarBrand.Honda, model: "Civic", year: 2017, price: 1800000, mileage: 60000, options: [CarOption.LeatherSeats]),
    CarRecommend(brand: CarBrand.BMW, model: "X5", year: 2021, price: 45000, mileage: 2500000, options: [CarOption.BackupCamera, CarOption.Sunroof]),
    CarRecommend(brand: CarBrand.Mercedes, model: "C-Class", year: 2019, price: 4000000, mileage: 35000, options: []),
    CarRecommend(brand: CarBrand.Ford, model: "Mustang", year: 2016, price: 2800000, mileage: 70000, options: [CarOption.Sunroof]),
    CarRecommend(brand: CarBrand.Chevrolet, model: "Malibu", year: 2022, price: 270000, mileage: 15000, options: []),
    CarRecommend(brand: CarBrand.Tesla, model: "Model 3", year: 2023, price: 5000000, mileage: 10000, options: [CarOption.AllWheelDrive, CarOption.HeatedSeats]),
    CarRecommend(brand: CarBrand.Nissan, model: "Altima", year: 2015, price: 1500000, mileage: 90000, options: [CarOption.Navigation, CarOption.Sunroof]),
    CarRecommend(brand: CarBrand.Kia, model: "Sportage", year: 2020, price: 2300000, mileage: 40000, options: []),
  ];



  static List<String> findMatchCars(int maxPrice, int minYear, int maxMileage, List<CarOption> desiredOptions) {
    return carDatabase
        .where((car) => _isCarEligible(car, maxPrice, minYear, maxMileage)) //  조건 만족 차량 필터링
        .map((car) => _carReport(car, desiredOptions)) //  결과 메시지 생성
        .toList();
  }

//  가격, 연식, 주행거리 조건을 만족하는지 확인
  static bool _isCarEligible(CarRecommend car, int maxPrice, int minYear, int maxMileage) {
    return car.price <= maxPrice && car.year >= minYear && car.mileage <= maxMileage;
  }

//  차량에 대한 상세 보고서 생성
  static String _carReport(CarRecommend car, List<CarOption> desiredOptions) {
    List<CarOption> existingOptions = car.options;
    List<CarOption> missingOptions = desiredOptions.where((opt) => !existingOptions.contains(opt)).toList();

    String baseOptionsMessage = _checkBaseOptions(existingOptions, missingOptions);
    String addableOptionsMessage = _checkAddableOptions(missingOptions);

    return "${car.brand} ${car.model} (${car.year}) - ${car.price}원\n"
        "$baseOptionsMessage\n"
        "$addableOptionsMessage\n";
  }

// 기본 장착 옵션 확인
  static String _checkBaseOptions(List<CarOption> existingOptions, List<CarOption> missingOptions) {
    List<CarOption> baseOptions = missingOptions.where((opt) => !opt.canBeAdded).toList();
    if (baseOptions.isEmpty) return "모든 기본 옵션이 만족됨.";

    return "추가 불가 옵션 (있으면 있음, 없으면 없음): " +
        baseOptions.map((opt) => "${opt.name} - ${existingOptions.contains(opt) ? '있음' : '없음'}").join(', ');
  }

//  추가 가능한 옵션과 가격 확인
  static String _checkAddableOptions(List<CarOption> missingOptions) {
    List<CarOption> addableOptions = missingOptions.where((opt) => opt.canBeAdded).toList();
    if (addableOptions.isEmpty) return "추가할 수 있는 옵션 없음.";

    return "추가 가능 옵션: " +
        addableOptions.map((opt) => "${opt.name} (+${opt.price}원)").join(', ');
  }

}
