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

#source('data/init.dart');
#source('data/display.dart');

#source('view/MenuBar.dart');
#source('view/Board.dart');
#source('view/ActionPanel.dart');


void main() {
  CarParkingModel carParkingModel = new CarParkingModel();
  // printModel(carParkingModel);
  
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  Board board = new Board(canvas, carParkingModel);
}


