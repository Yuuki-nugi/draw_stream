import 'dart:ui';

// class of holding drawing data for one frame
class DrawingData {
  final List<LineData> lines;
  final List<CircleData> circles;

  DrawingData({
    required this.lines,
    required this.circles,
  });

  Map<String, dynamic> toJson() {
    return {
      'lines': lines.map((e) => e.toJson()).toList(),
      'circles': circles.map((e) => e.toJson()).toList(),
    };
  }
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

  Map<String, dynamic> toJson() {
    return {
      'center': {
        'dx': center.dx,
        'dy': center.dy,
      },
      'radius': radius,
      'color': color.value,
      'strokeWidth': strokeWidth,
    };
  }
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

  Map<String, dynamic> toJson() {
    return {
      'start': {
        'dx': start.dx,
        'dy': start.dy,
      },
      'end': {
        'dx': end.dx,
        'dy': end.dy,
      },
      'color': color.value,
      'strokeWidth': strokeWidth,
    };
  }
}
