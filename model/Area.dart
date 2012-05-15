class Area extends Concept {
  
  String code;
  
  Parkings parkings;
  
  Area(this.code) {
    parkings = new Parkings.ofArea(this);
  }
  
  String toString() {
    return 'Area: ${oid.timeStamp} ${code}';
  }
  
}
