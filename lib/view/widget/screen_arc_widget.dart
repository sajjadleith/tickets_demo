import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class ScreenArc
    extends
        StatelessWidget {
  const ScreenArc({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return CustomPaint(
      size: const Size(
        double.infinity,
        80,
      ), // الارتفاع العام
      painter: _ScreenArcPainter(),
    );
  }
}

class _ScreenArcPainter
    extends
        CustomPainter {
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final w = size.width;
    final h = size.height;

    // 🎨 تدرج لوني للمنطقة المظللة أسفل الشاشة
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ThemeColors.secondaryColor,
        Colors.white.withOpacity(
          0.2,
        ),
      ],
    );

    // path للقوس السفلي (منطقة الظل)
    final Path path = Path();
    path.moveTo(
      0,
      h *
          0.7,
    );
    path.quadraticBezierTo(
      w /
          2,
      -h *
          0.5,
      w,
      h *
          0.7,
    );
    path.lineTo(
      w,
      h,
    );
    path.lineTo(
      0,
      h,
    );
    path.close();

    // 🎨 ارسم التدرج في المنطقة
    final paintFill = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(
          0,
          0,
          w,
          h,
        ),
      )
      ..style = PaintingStyle.fill;
    canvas.drawPath(
      path,
      paintFill,
    );

    // 🎨 ارسم خط القوس نفسه بلون فاتح وسماكة
    final paintBorder = Paint()
      ..color =
          const Color(
            0xFFF7F4E0,
          ) // لون أبيض مائل للأصفر
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    final Path borderPath = Path();
    borderPath.moveTo(
      0,
      h *
          0.7,
    );
    borderPath.quadraticBezierTo(
      w /
          2,
      -h *
          0.5,
      w,
      h *
          0.7,
    );
    canvas.drawPath(
      borderPath,
      paintBorder,
    );
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) => false;
}
