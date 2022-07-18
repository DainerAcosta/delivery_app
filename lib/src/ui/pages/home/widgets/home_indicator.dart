import 'package:delivery_app/src/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeTabBarIndicator extends Decoration {
  final Color color;
  final double size;

  const HomeTabBarIndicator({this.color = primaryColor, this.size = 8});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(color: color, size: size);
  }
}

class _CustomPainter extends BoxPainter {
  final Color color;
  final double size;

  _CustomPainter({
    required this.color,
    required this.size,
  });

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    final paint = Paint();
    paint.color = color;
    final width = configuration.size!.width;
    final height = configuration.size!.height;
    final Offset position =
        Offset(offset.dx + (width / 2), offset.dy + height - 6);
    canvas.drawCircle(position, size / 2, paint);
  }
}
