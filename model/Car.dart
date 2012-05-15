class Car extends Concept {
  
  Parking parking;
  CarBrand carBrand;
  
  String orientation;
  int startRow;
  int startColumn;
  
  int currentRow;
  int currentColumn;
  
  Car(this.parking, this.carBrand) {
    
  }
  
  String toString() {
    return 'Car: ${oid.timeStamp} ${orientation} ${startRow} ${startColumn}';
  }
  
}
