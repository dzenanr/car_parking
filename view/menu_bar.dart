part of car_parking;

class MenuBar {

  final Board board;

  // Area
  ButtonElement beginnerAreaButton;
  ButtonElement intermediateAreaButton;

  // Parking
  ButtonElement parking1Button;
  ButtonElement parking2Button;

  MenuBar(this.board) {
    beginnerAreaButton = document.query('#beginner');
    intermediateAreaButton = document.query('#intermediate');

    parking1Button = document.query('#parking1');
    parking2Button = document.query('#parking2');

    beginnerAreaButton.on.click.add((MouseEvent e) {
      board.currentArea = board.carParkingModel.areas.getArea('beginner');
    });
    intermediateAreaButton.on.click.add((MouseEvent e) {
      board.currentArea = board.carParkingModel.areas.getArea('intermediate');
    });

    parking1Button.on.click.add((MouseEvent e) {
      board.currentParking = board.currentArea.parkings.getParkingWithinArea(1);
    });
    parking2Button.on.click.add((MouseEvent e) {
      board.currentParking = board.currentArea.parkings.getParkingWithinArea(2);
    });
  }

}
