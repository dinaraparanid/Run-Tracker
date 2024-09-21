import 'package:flutter/rendering.dart';

const _strokeWidth = 4.0;
const _innerMarkerRadius = 6.0;
const _outerMarkerRadius = 8.0;

Rect _innerMarkerBorders(double top, double left) => Rect.fromLTRB(
  -_innerMarkerRadius + left,
  -_innerMarkerRadius + top,
  _innerMarkerRadius + left,
  _innerMarkerRadius + top,
);

Rect _outerMarkerBorders(double top, double left) => Rect.fromLTRB(
  -_outerMarkerRadius + left,
  -_outerMarkerRadius + top,
  _outerMarkerRadius + left,
  _outerMarkerRadius + top,
);

final class SprintMarkerPainter extends CustomPainter {
  final Color color;
  final double top;
  final double left;

  const SprintMarkerPainter({
    required this.color,
    required this.top,
    required this.left,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final commonPaint = Paint()
      ..strokeWidth = _strokeWidth
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      _outerMarkerBorders(top, left),
      commonPaint..color = color.withOpacity(0.5),
    );

    canvas.drawOval(
        _innerMarkerBorders(top, left),
        commonPaint..color = color,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
