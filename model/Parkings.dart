class Parkings extends Concepts {
  
  Area area;
  
  Parkings.ofArea(this.area) {
     
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
