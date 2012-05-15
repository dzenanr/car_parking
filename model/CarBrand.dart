class CarBrand extends Concept {
  
  String code;
  int length;
  String colorName;
  int red;
  int green;
  int blue;
  
  Cars cars;
  
  CarBrand(this.code) {
    cars = new Cars.ofCarBrand(this);
  }
  
  String toString() {
    return 'Car Brand: ${oid.timeStamp} ${code} ${length} ${colorName}';
  }
  
}
