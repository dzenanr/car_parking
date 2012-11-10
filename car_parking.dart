import 'dart:html';

part 'meta/oid.dart';
part 'meta/concept.dart';
part 'meta/concepts.dart';


part 'model/areas.dart';
part 'model/cars.dart';
part 'model/car_brands.dart';
part 'model/parkings.dart';

part 'model/model.dart';

part 'data/init.dart';
part 'data/display.dart';

part 'view/menu_bar.dart';
part 'view/board.dart';
part 'view/action_panel.dart';


void main() {
  CarParkingModel carParkingModel = new CarParkingModel();
  // printModel(carParkingModel);

  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  Board board = new Board(canvas, carParkingModel);
}


