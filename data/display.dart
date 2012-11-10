

printAreaParkingCar(CarParkingModel carParkingModel) {
  print('-----------------------');
  print('-Areas, Parkings, Cars-');
  print('-----------------------');
  Areas areas = carParkingModel.areas;
  for (Area area in areas) {
    area.display();
    Parkings parkings = area.parkings;
    for (Parking parking in parkings) {
      parking.display();
      Cars cars = parking.cars;
      for (Car car in cars) {
        car.display();
        car.carBrand.display();
      }
    }
  }
}

printCarBrandCar(CarParkingModel carParkingModel) {
  print('-----------------');
  print('-CarBrands, Cars-');
  print('-----------------');
  CarBrands carBrands = carParkingModel.carBrands;
  for (CarBrand carBrand in carBrands) {
    carBrand.display();
    Cars cars = carBrand.cars;
    for (Car car in cars) {
      car.display();
      car.parking.display();
    }
  }
}

printParkingCar(CarParkingModel carParkingModel) {
  print('----------------');
  print('-Parkings, Cars-');
  print('----------------');
  Parkings parkings = carParkingModel.parkings;
  for (Parking parking in parkings) {
    parking.display();
    parking.area.display();
    Cars cars = parking.cars;
    for (Car car in cars) {
      car.display();
      car.carBrand.display();
    }
  }
}

printModel(CarParkingModel carParkingModel) {
  printAreaParkingCar(carParkingModel);
  printCarBrandCar(carParkingModel);
  printParkingCar(carParkingModel);
}

