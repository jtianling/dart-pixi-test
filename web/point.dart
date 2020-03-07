class Point {
  num x, y;

  Point(this.x, this.y);

  Point.origin() {
    x = 0;
    y = 0;
  }

  @override
  String toString() {
    var s = 'x=${x}, y=${y}';
    return s;
  }
}
