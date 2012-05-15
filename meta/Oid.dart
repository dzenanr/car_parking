class Oid {
  
  static int increment = 0;
  
  int timeStamp;
  
  Oid() {
    Date nowDate = new Date.now();
    int nowValue = nowDate.value;
    timeStamp = nowValue + increment++;
  }
  
}