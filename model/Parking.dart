class Parking extends Concept {
  
  Area area;
  
  int number;
  
  Cars cars;
  
  Parking(this.area, this.number) {
    cars = new Cars.ofParking(this);
  }
  
  String toString() {
    return 'Parking: ${oid.timeStamp} ${number}';
  }
  
}
