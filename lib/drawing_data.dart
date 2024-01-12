import 'dart:ui';

// class of holding drawing data for one frame
class DrawingData {
  final List<LineData> lines;
  final List<CircleData> circles;

  DrawingData({
    required this.lines,
    required this.circles,
  });
}

class CircleData {
  final Offset center;
  final double radius;
  final Color color;
  final double strokeWidth;

  CircleData({
    required this.center,
    required this.radius,
    required this.color,
    required this.strokeWidth,
  });
}

class LineData {
  final Offset start;
  final Offset end;
  final Color color;
  final double strokeWidth;

  LineData({
    required this.start,
    required this.end,
    required this.color,
    required this.strokeWidth,
  });
}
