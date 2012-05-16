class Cars extends Concepts {
  
  Parking parking;
  CarBrand carBrand;
  
  Cars.ofParking(this.parking) {
    
  }
  
  Cars.ofCarBrand(this.carBrand) {
    
  }
  
  void deselect() {
    for (Car car in this) {
      car.selected = false;
    }
  }
  
  Car getSelectedCar() {
    for (Car car in this) {
      if (car.selected) {
        return car;
      }
    }
    return null;
  }
  
}
