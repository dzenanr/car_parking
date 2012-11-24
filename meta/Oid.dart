part of car_parking;

class Oid {

  static int increment = 0;

  int timeStamp;

  Oid() {
    Date nowDate = new Date.now();
    int nowValue = nowDate.millisecondsSinceEpoch;  // versus nowDate.millisecond ?
    timeStamp = nowValue + increment++;
  }

}