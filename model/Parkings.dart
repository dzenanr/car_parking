class Parkings extends Concepts {

  Area area;

  Parkings();

  Parkings.ofArea(this.area);

  Parking getParkingWithinArea(int number) {
    for (Parking parking in this) {
      if (parking.number == number) {
        return parking;
      }
    }
    return null;
  }

  Parking getParking(String code, int number) {
    for (Parking parking in this) {
      if (parking.area.code == code && parking.number == number) {
        return parking;
      }
    }
    return null;
  }

}
