#import('dart:html');

#source('meta/Oid.dart');
#source('meta/Concept.dart');
#source('meta/Concepts.dart');

#source('model/Area.dart');
#source('model/Car.dart');
#source('model/CarBrand.dart');
#source('model/Parking.dart');

#source('model/Areas.dart');
#source('model/Cars.dart');
#source('model/CarBrands.dart');
#source('model/Parkings.dart');

#source('model/CarParkingModel.dart');

#source('view/Board.dart');

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

void main() {
  CarParkingModel carParkingModel = new CarParkingModel();
  // printModel(carParkingModel);
  
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  Parking parking = carParkingModel.parkings.getParking('beginner', 1);
  Board board = new Board(canvas, parking);
}


