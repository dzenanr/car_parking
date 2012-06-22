class Areas extends Concepts {

  Area getArea(String code) {
    for (Area area in this) {
      if (area.code == code) {
        return area;
      }
    }
    return null;
  }

}
