class Car extends Concept {

  Parking parking;
  CarBrand carBrand;

  String orientation;
  int startRow;
  int startColumn;

  int currentRow;
  int currentColumn;
  bool selected = false;

  Car(this.parking, this.carBrand);

  String toString() {
    return 'Car: ${oid.timeStamp} ${orientation} ${startRow} ${startColumn}';
  }

  bool inCell(int row, int column) {
    if (currentRow == row && currentColumn == column) {
      return true;
    } else if (orientation == 'horizontal' && carBrand.length == 2) {
      if (currentRow == row && currentColumn == column - 1) {
        return true;
      }
    } else if (orientation == 'horizontal' && carBrand.length == 3) {
      if (currentRow == row && (currentColumn == column - 1 || currentColumn == column - 2)) {
        return true;
      }
    } else if (orientation == 'vertical' && carBrand.length == 2) {
      if (currentRow == row - 1 && currentColumn == column) {
        return true;
      }
    } else if (orientation == 'vertical' && carBrand.length == 3) {
      if ((currentRow == row - 1 || currentRow == row - 2) && currentColumn == column) {
        return true;
      }
    }
    return false;
  }

  bool afterCell(int row, int column) {
    if (orientation == 'horizontal') {
      if (currentRow == row && currentColumn == column + 1) {
        return true;
      }
    } else if (orientation == 'vertical') {
      if (currentRow == row + 1 && currentColumn == column) {
        return true;
      }
    }
    return false;
  }

  bool beforeCell(int row, int column) {
    if (orientation == 'horizontal') {
      if (currentRow == row && carBrand.length == 2 && currentColumn == column - 2) {
        return true;
      } else if (currentRow == row && carBrand.length == 3 && currentColumn == column - 3) {
        return true;
      }
    } else if (orientation == 'vertical') {
      if (currentRow == row - 2 && carBrand.length == 2 && currentColumn == column) {
        return true;
      } else if (currentRow == row - 3 && carBrand.length == 3 && currentColumn == column) {
        return true;
      }
    }
    return false;
  }

  bool afterOrBeforeCell(int row, int column) {
    return afterCell(row, column) || beforeCell(row, column);
  }

  moveToOrTowardCell(int row, int column) {
    if (afterCell(row, column)) {
      currentRow = row;
      currentColumn = column;
    } else if (beforeCell(row, column)) {
      if (orientation == 'horizontal') {
        currentColumn = currentColumn + 1;
      } else if (orientation == 'vertical') {
        currentRow = currentRow + 1;
      }
    }
  }

}
