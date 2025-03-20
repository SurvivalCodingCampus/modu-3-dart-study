enum CarBrand {
  Hyundai,
  Kia,
  BMW,
  Mercedes,
  Ford,
  Chevrolet,
  Tesla,
  Ferrari,
  Lamborghini,
  Cadillac,
}

enum CarModel {
  // 현대 (단위: km/L)
  Sonata(CarBrand.Hyundai, 2500000, 12.0),
  Avante(CarBrand.Hyundai, 2000000, 14.0),
  Tucson(CarBrand.Hyundai, 2800000, 11.5),
  SantaFe(CarBrand.Hyundai, 3500000, 10.0),
  Palisade(CarBrand.Hyundai, 4000000, 8.5),

  // 기아
  K5(CarBrand.Kia, 2500000, 12.5),
  Sorento(CarBrand.Kia, 3800000, 10.5),
  Sportage(CarBrand.Kia, 3200000, 11.0),
  Stinger(CarBrand.Kia, 5000000, 9.0),
  Carnival(CarBrand.Kia, 4200000, 8.5),

  // BMW
  Series3(CarBrand.BMW, 5000000, 13.0),
  Series5(CarBrand.BMW, 7000000, 11.5),
  X3(CarBrand.BMW, 6500000, 10.5),
  X5(CarBrand.BMW, 9000000, 9.0),
  i4(CarBrand.BMW, 8000000, 5.5), // 전기차

  // Mercedes
  CClass(CarBrand.Mercedes, 5500000, 12.5),
  EClass(CarBrand.Mercedes, 8000000, 10.5),
  SClass(CarBrand.Mercedes, 12000000, 9.0),
  GLC(CarBrand.Mercedes, 7500000, 9.5),
  GLE(CarBrand.Mercedes, 9500000, 8.5),

  // Ford
  Mustang(CarBrand.Ford, 6500000, 8.0),
  Explorer(CarBrand.Ford, 5000000, 9.5),
  F150(CarBrand.Ford, 6000000, 7.0),
  Focus(CarBrand.Ford, 2500000, 13.5),
  Edge(CarBrand.Ford, 4000000, 10.0),

  // Chevrolet
  Malibu(CarBrand.Chevrolet, 2800000, 12.5),
  Impala(CarBrand.Chevrolet, 3500000, 11.0),
  Traverse(CarBrand.Chevrolet, 4500000, 9.0),
  Camaro(CarBrand.Chevrolet, 6000000, 7.5),
  Tahoe(CarBrand.Chevrolet, 7500000, 6.5),

  // Tesla (전기차 - 단위: km/kWh)
  Model3(CarBrand.Tesla, 5000000, 6.2),
  ModelS(CarBrand.Tesla, 9000000, 5.5),
  ModelX(CarBrand.Tesla, 10000000, 5.0),
  ModelY(CarBrand.Tesla, 7000000, 6.0),
  Cybertruck(CarBrand.Tesla, 8000000, 4.5),

  // Ferrari
  F8Tributo(CarBrand.Ferrari, 40000000, 6.5),
  SF90Stradale(CarBrand.Ferrari, 60000000, 6.0),
  Roma(CarBrand.Ferrari, 35000000, 7.5),
  Portofino(CarBrand.Ferrari, 45000000, 7.0),
  LaFerrari(CarBrand.Ferrari, 150000000, 5.5),

  // Lamborghini
  Aventador(CarBrand.Lamborghini, 60000000, 5.5),
  Huracan(CarBrand.Lamborghini, 50000000, 6.5),
  Urus(CarBrand.Lamborghini, 35000000, 8.0),
  Revuelto(CarBrand.Lamborghini, 70000000, 5.0),
  Gallardo(CarBrand.Lamborghini, 45000000, 6.0),

  // Cadillac
  CT4(CarBrand.Cadillac, 3500000, 11.5),
  CT5(CarBrand.Cadillac, 4500000, 10.0),
  Escalade(CarBrand.Cadillac, 9000000, 7.5),
  XT5(CarBrand.Cadillac, 6000000, 9.5),
  Lyriq(CarBrand.Cadillac, 8000000, 5.0); // 전기차

  final CarBrand brand;
  final int initialPrice;
  final double fuelEfficiency;

  const CarModel(this.brand, this.initialPrice, this.fuelEfficiency);
}

extension CarModelExtension on CarModel {
  CarBrand getBrand() => brand;

  int getInitialPrice() => initialPrice;

  double getFuelEfficiency() => fuelEfficiency;
}

enum CarOption {
  Navigation,
  BackupCamera,
  HeatedSeats,
  Bluetooth,
  AndroidAuto,
  Tinting,
  AllWheelDrive,
  Sunroof,
  LeatherSeats,
}

extension CarOptionPrice on CarOption {
  int get price =>
      switch (this) {
        CarOption.Navigation => 200000,
        CarOption.BackupCamera => 100000,
        CarOption.HeatedSeats => 120000,
        CarOption.Bluetooth => 80000,
        CarOption.AndroidAuto => 90000,
        CarOption.Tinting => 180000,
        CarOption.AllWheelDrive => 0,
        CarOption.Sunroof => 0,
        CarOption.LeatherSeats => 0,
      };

  bool get canBeAdded =>
      switch (this) {
        CarOption.AllWheelDrive => false,
        CarOption.Sunroof => false,
        CarOption.LeatherSeats => false,
        _ => true,
      };
}
