class CarBrands extends Concepts {

  CarBrand getCarBrand(String code) {
    for (CarBrand carBrand in this) {
      if (carBrand.code == code) {
        return carBrand;
      }
    }
    return null;
  }

}

class CarBrand extends Concept {

  String code;
  int length;
  String colorName;
  String color;
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


