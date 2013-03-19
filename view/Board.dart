part of car_parking;

class Board {

  // The board is redrawn every INTERVAL ms.
  static const int INTERVAL = 8;

  static final int LINE_WIDTH = 1;
  static final String LINE_COLOR = '#000000'; // black
  static final int SSS = 8; // selection square size

  static final int ROWS_COUNT = 6;
  static final int COLUMNS_COUNT = 6;

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  int width;
  int height;
  int cellWidth;
  int cellHeight;

  CarParkingModel carParkingModel;
  Area _currentArea;
  Parking _currentParking;

  MenuBar menuBar;
  ActionPanel actionPanel;

  Board(this.canvas, this.carParkingModel) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;
    cellWidth = width ~/ COLUMNS_COUNT;
    cellHeight = height ~/ ROWS_COUNT;
    // border();

    menuBar = new MenuBar(this);
    actionPanel = new ActionPanel(this);

    currentArea = carParkingModel.areas.getArea('beginner');
    currentParking = currentArea.parkings.getParkingWithinArea(1);

    // Canvas event.
    document.query('#canvas').onMouseDown.listen(onMouseDown);
    // Redraw every INTERVAL ms.
    new Timer.periodic(const Duration(milliseconds: INTERVAL), (t) => redraw());
  }

  void set currentArea(Area area) {
    _currentArea = area;
    currentParking = area.parkings.getParkingWithinArea(1);
    actionPanel.displayCurrentArea();
  }

  Area get currentArea {
    return _currentArea;
  }

  void set currentParking(Parking parking) {
    _currentParking = parking;
    actionPanel.displayCurrentParking();
  }

  Parking get currentParking {
    return _currentParking;
  }

  void redraw() {
    clear();
    displayCars();
  }

  void restart() {
    for (Car car in currentParking.cars) {
      car.currentRow = car.startRow;
      car.currentColumn = car.startColumn;
      car.selected = false;
    }
  }

  void clear() {
    context.clearRect(0, 0, width, height);
    // border();
  }

  void border() {
    context.beginPath();
    context.rect(0, 0, width, height);
    context.lineWidth = LINE_WIDTH;
    context.strokeStyle = LINE_COLOR;
    context.stroke();
    context.closePath();
  }

  void displayCars() {
    for (Car car in currentParking.cars) {
      displayCar(car);
    }
  }

  void displayCar(Car car) {
    context.beginPath();
    int row = car.currentRow;
    int column = car.currentColumn;
    int x = column * cellWidth;
    int y = row * cellHeight;
    int carLength = car.carBrand.length;
    int carWidth = cellWidth;
    int carHeight = cellHeight;
    if (car.orientation == 'horizontal') {
      carWidth = cellWidth * carLength;
    } else {
      carHeight = cellHeight * carLength;
    }
    context.lineWidth = LINE_WIDTH;
    context.strokeStyle = LINE_COLOR;
    context.fillStyle = car.carBrand.color;
    // context.rect(x, y , carWidth, carHeight);
    context.fillRect(x, y , carWidth, carHeight);
    if (car.selected) {
      context.rect(x, y, SSS, SSS);
      context.rect(x + carWidth - SSS, y, SSS, SSS);
      context.rect(x + carWidth - SSS, y + carHeight - SSS, SSS, SSS);
      context.rect(x, y + carHeight - SSS, SSS, SSS);
    }
    context.stroke();
    context.closePath();
  }

  Car getCarInCell(int row, int column) {
    for (Car car in currentParking.cars) {
      if (car.inCell(row, column)) {
        return car;
      }
    }
    return null;
  }

  Car getSelectedCarAfterOrBeforeCell(int row, int column) {
    for (Car car in currentParking.cars) {
      if (car.selected && car.afterOrBeforeCell(row, column)) {
        return car;
      }
    }
    return null;
  }

  void onMouseDown(MouseEvent e) {
    int row = e.offset.y ~/ cellHeight;
    int column = e.offset.x ~/ cellWidth;
    Car car = getCarInCell(row, column);
    if (car != null) {
      currentParking.cars.deselect();
      car.selected = true;
    } else {
      car = getSelectedCarAfterOrBeforeCell(row, column);
      if (car != null) {
        car.moveToOrTowardCell(row, column);
        if (car.carBrand.code == 'X' && car.currentColumn == COLUMNS_COUNT - car.carBrand.length) {
          car.currentColumn = COLUMNS_COUNT; // the car exits the parking
        }
      }
    }
  }

}
