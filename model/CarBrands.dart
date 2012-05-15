class CarBrands extends Concepts {
  
  CarBrands() {
    
  }
  
  CarBrand getCarBrand(String code) {
    for (CarBrand carBrand in this) {
      if (carBrand.code == code) {
        return carBrand;
      }
    }
    return null;
  }
  
}
