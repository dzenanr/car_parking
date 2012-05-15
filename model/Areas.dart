class Areas extends Concepts {
  
  Areas() {
      
  }
  
  Area getArea(String code) {
    for (Area area in this) {
      if (area.code == code) {
        return area;
      }
    }
    return null;
  }
  
}
