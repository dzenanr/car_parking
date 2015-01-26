import 'dart:html';

import 'package:car_parking/car_parking.dart';

void main() {
  CarParkingModel carParkingModel = new CarParkingModel();
  // printModel(carParkingModel);

  // Get a reference to the canvas.
  CanvasElement canvas = document.querySelector('#canvas');
  Board board = new Board(canvas, carParkingModel);
}


